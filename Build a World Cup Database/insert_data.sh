#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | sed '1d' | while IFS=',' read -r year round winner opponent winner_goals opponent_goals;
do
  IN_TEAMS=$($PSQL "INSERT INTO teams(name) VALUES ('$winner') ON CONFLICT DO NOTHING;")
  echo "$IN_TEAMS"

  IN_TEAMS=$($PSQL "INSERT INTO teams(name) VALUES ('$opponent') ON CONFLICT DO NOTHING;")
  echo "$IN_TEAMS"

  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$winner';")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$opponent';")

  IN_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
                    VALUES ($year, '$round', $WINNER_ID, $OPPONENT_ID, $winner_goals, $opponent_goals);")
  echo "$IN_GAMES"
done
