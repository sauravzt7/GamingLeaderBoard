#!/bin/bash

# API URL
URL="http://localhost:8080/api/leaderboard/top"

# Send GET request
curl -X GET "$URL" \
     -H "Content-Type: application/json" \
     -w "\nResponse Code: %{http_code}\n"

echo "Fetch leaderboard"
