-- first let's clear out an old database if it exists
DROP DATABASE IF EXISTS tournament;

-- the we'll create ours
CREATE DATABASE tournament;

-- next we can connect to it
\c tournament

-- the 'players' table will track players and match them with a
-- unique serial id
create table players (id serial primary key, name varchar);

-- 'matches' will record each match played (keeping a unique id for each)
-- and will simply track the winner and loser of each match
create table matches (match serial primary key, winner integer references
  players(id), loser integer references players(id));


-- the view 'rankings' presents four columns - player id and name,
-- their win count, and their total matches played, ranking them in
-- descending order by number of wins
create view rankings as select id, name,
  count(matches1.winner) as wins,
  count(matches2.winner + matches2.loser) as matches
  from players
  left join matches as matches1 on players.id = matches1.winner
  left join matches as matches2 on players.id = matches2.loser
    or players.id = matches2.winner
  group by players.id order by wins desc;
