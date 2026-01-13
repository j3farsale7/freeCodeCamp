#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# FUNCTIONS
VALIDATE_USER() {
  if [[ ${#USER_NAME} -gt 22 ]]; then
   exit 1
  fi
}

HANDLE_ENTRY() {
  read ENTRY
  ((++COUNTER))
  if [[ ! $ENTRY =~ ^[0-9]+$ ]]; then 
    echo "That is not an integer, guess again:"
    read ENTRY
  fi
}

HANDLE_WINNER(){
  #UPDATE games_played
  TEMP1=$($PSQL "UPDATE data_table SET games_played = games_played + 1 WHERE username = '$USER_NAME'")
  # lookup best_game
  # if counter < best_game then update best game
  LKUP_BSTGAME=$($PSQL "SELECT best_game FROM data_table WHERE username = '$USER_NAME'" )
  if [[ $LKUP_BSTGAME -eq 0 || $COUNTER -lt $LKUP_BSTGAME ]]; then
  TEMP2=$($PSQL "UPDATE data_table SET best_game = '$COUNTER' WHERE username = '$USER_NAME'")
  fi
}


# Flow:
# Stage 1 : username
echo "Enter your username:"
read USER_NAME
VALIDATE_USER
LOOKUP_USER=$($PSQL "SELECT games_played FROM data_table WHERE username = '$USER_NAME'")
#LOOKUP_USER2=$($PSQL "SELECT username FROM data_table WHERE username = '$USER_NAME'")
# whether username found or not
if [[ $LOOKUP_USER -gt 0 ]]; then
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM data_table WHERE username = '$USER_NAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM data_table WHERE username = '$USER_NAME'")
  echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

if [[ $LOOKUP_USER -eq 0 ]]; then 
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
  $PSQL "INSERT INTO data_table(username, games_played, best_game) VALUES ('$USER_NAME', 0, 0)"
fi


# Stage 2 : into the game
SECRET=$((1 + RANDOM % 1000))
# echo "secet is: $SECRET"
echo "Guess the secret number between 1 and 1000:"
COUNTER=0
HANDLE_ENTRY

# Stage 3 : the game is underway
while true; do
  if [[ $ENTRY -lt $SECRET  ]]; then  
    echo "It's higher than that, guess again:"
    HANDLE_ENTRY
  elif [[ $ENTRY -gt $SECRET ]]; then
    echo "It's lower than that, guess again:" 
    HANDLE_ENTRY
  else
    HANDLE_WINNER
    echo  "You guessed it in $COUNTER tries. The secret number was $SECRET. Nice job!"
    break
  fi 
done

