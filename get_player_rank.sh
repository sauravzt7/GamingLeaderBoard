#!/bin/bash

# API URL
USER_ID=1  # Change this to test for different users
URL="http://localhost:8080/api/leaderboard/rank/$USER_ID"

# Send GET request
curl -X GET "$URL" \
     -H "Content-Type: application/json" \
     -w "\nResponse Code: %{http_code}\n"

echo "Fetched player rank successfully!"
