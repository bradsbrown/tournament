#Welcome to Tournament!

This package is designed to track players for any game in any simple
Swiss Pairing playoff game. Here's what you need to know to get rolling:

##SETUP

1. If you haven't already done so, connect to your database - edit
    tournament.py to where noted in the notes to connect it to your database.

2. If you don't already have your database created, navigate in your command
    line to the tournament folder, then open psql and enter:

        CREATE database tournament;

    THEN

        \c tournament

    to connect to the new database

3. Use our handy SQL script to set up your tables - now that you have already
    navigated to the correct folder in your CLI, created and connected to
    your database in the step above, all you have to do is enter:

        \i tournament.sql

    to get all the tables and views necessary set up and ready to roll.

4. From your command line, cd into the tournament directory, launch python,
    then pull in the tournament.py file like so:

        from tournament import *

5. If you'd like to test that your system is fully up and operational at
    this point (definitely a good idea), we have included a test script that
    will verify all fuctions of the code and database are interacting properly.
    from your command line in the tournament folder, simply run:

        python tournament_test.py

    If anything isn't working as intended, it will let you know what went wrong.
    If all tests pass, you're good to go!

5. In your python terminal, enter each player's name using:

        registerPlayer("[player's full name]")

    For example, if you need to enter Bob Smith, you'll run:

        registerPlayer("Bob Smith")

    That's it! your roster is now ready to start.




##FUNCTION LIST


Here is a quick rundown of the functions you'll need as we go:

**registerPlayer(name)** - As mentioned above, this is how you will add a new
                player to the roster.

**playerStandings()** - this returns a list of players with their id number,
                as well as their win record and total number of matches.

**reportMatch(winner, loser)** - You will use this to report each match after it
                concludes. 'winner' and 'loser' here are the id numbers
                of the respective players in the match (obtained from
                running playerStandings() to get their id).
                **The winner's id must be entered first to record properly**

**swissPairings()** - this will return a list of players paired up for the next
                round of play, according to their win record (each player will
                be matched up with an opponent with similar win record).

**deleteMatches()** - you will use this to clear the match record before beginning
                a new tournament.
                **This will permanently clear all match data**

**deletePlayers()** - if you are beginning a new tournament with different
                players, this will clear the roster to enter new player info.
                **This will permanently clear all player names.**




##USING TOURNAMENT

- So as you set up a new tournament, assuming new players, you will want to:

        deleteMatches()

        deletePlayers()

    to clear the records.

- Then start entering your players with:

        registerPlayer(name)

- Once they are all entered you can use:

        playerStandings()

    to get your list of names, verify everyone is in, and note their ID numbers.

- At the end of the round, enter each match with:

        reportMatch(winner, loser)

- Then once all are entered, you'll call:

        swissPairings()

    to get your list of matchups for the following round.

- Once all rounds of your tournament are complete and all matches have been
    entered, you can use:

        playerStandings()

    one last time to get the final results of the tournament.

**HAPPY GAMING!**
