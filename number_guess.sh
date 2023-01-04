#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=game --tuples-only -c"


echo "Enter your username: "
read USERNAME
GAMES_NUMBER=0;
GUESSES=9999;


RAND_NUM=$(( $RANDOM % 1000 + 1 ))

ID=$($PSQL "SELECT id FROM user_record WHERE username='$USERNAME'")

if [[ -z $ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT=$($PSQL "INSERT INTO user_record(username) VALUES('$USERNAME')")
else
  GAMES_NUMBER=$($PSQL "SELECT games_played FROM user_record WHERE username='$USERNAME'")
  GAMES_NUMBER=$(echo $GAMES_NUMBER | xargs)
  GUESSES=$($PSQL "SELECT guesses FROM user_record WHERE username='$USERNAME'")
  GUESSES=$(echo $GUESSES | xargs)
  echo "Welcome back, $USERNAME! You have played $GAMES_NUMBER games, and your best game took $GUESSES guesses."
fi

echo "Guess the secret number between 1 and 1000:"

GUESSESNOW=0;

while [[ "$GUESS_NUM" != "$RAND_NUM" ]]
do
  read GUESS_NUM
  ((GUESSESNOW=GUESSESNOW+1))

  if [[ $GUESS_NUM =~ ^[0-9]+$ ]]
  then
    if (( $GUESS_NUM > $RAND_NUM ))
    then
      echo "It's lower than that, guess again:"
    elif (( $GUESS_NUM < $RAND_NUM ))
    then
      echo "It's higher than that, guess again:"
    fi
  else
    echo "That is not an integer, guess again:"
  fi

done

echo "You guessed it in $GUESSESNOW tries. The secret number was $RAND_NUM. Nice job!"

((GAMES_NUMBER=GAMES_NUMBER+1))

UPDATE1=$($PSQL "UPDATE user_record SET games_played=$GAMES_NUMBER WHERE username='$USERNAME'")

if (( GUESSESNOW < GUESSES ))
then
  UPDATE2=$($PSQL "UPDATE user_record SET guesses=$GUESSESNOW WHERE username='$USERNAME'")
fi


