#!/bin/bash

# API Endpoint
URL="http://localhost:8080/api/leaderboard/submit"

# Number of scores to submit
NUM_SCORES=1000

# Array of possible game modes
GAME_MODES=("Classic" "Arcade" "Survival")

echo "Submitting $NUM_SCORES random scores to the leaderboard..."

for ((i=1; i<=NUM_SCORES; i++))
do
  # Generate random userId (assuming users exist in DB from 1 to 1000)
  USER_ID=$((RANDOM % 1000 + 1))

  # Generate a random score (between 100 and 1000)
  SCORE=$((RANDOM % 901 + 100))

  # Select a random game mode
  GAME_MODE=${GAME_MODES[$RANDOM % ${#GAME_MODES[@]}]}

  # JSON payload
  DATA=$(cat <<EOF
{
    "userId": $USER_ID,
    "score": $SCORE,
    "gameMode": "$GAME_MODE"
}
EOF
  )

  # Send POST request
  RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" -X POST "$URL" \
       -H "Content-Type: application/json" \
       -d "$DATA")

  # Log response
  echo "Submitted Score #$i -> User: $USER_ID | Score: $SCORE | Mode: $GAME_MODE | Status: $RESPONSE"
done

echo "✅ Finished submitting $NUM_SCORES scores!"
