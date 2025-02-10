#!/bin/bash

# API URL
URL="http://localhost:8080/api/leaderboard/submit"

# JSON payload
DATA=$(cat <<EOF
{
    "userId": 1,
    "score": 500,
    "gameMode": "Classic"
}
EOF
)

# Send POST request
curl -X POST "$URL" \
     -H "Content-Type: application/json" \
     -d "$DATA" \
     -w "\nResponse Code: %{http_code}\n"

echo "Score submitted successfully!"
