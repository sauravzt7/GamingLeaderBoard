#!/bin/bash

# Database Configuration
DB_NAME="leaderboard_db"
DB_USER="postgres"  # Change if needed
DB_HOST="localhost"
DB_PORT="5432"

# Number of users to insert
NUM_USERS=1000

echo "Inserting $NUM_USERS users into the database..."

# Generate SQL INSERT commands
SQL="INSERT INTO users (username, join_date) VALUES"

for ((i=1; i<=NUM_USERS; i++))
do
  USERNAME="user_$RANDOM$RANDOM"  # Random unique username

  # Check OS and generate random timestamp
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # MacOS
    TIMESTAMP=$(date -v -$((RANDOM % 365))d '+%Y-%m-%d %H:%M:%S')
  else
    # Linux
    TIMESTAMP=$(date -d "$((RANDOM % 365)) days ago" '+%Y-%m-%d %H:%M:%S')
  fi

  SQL+=" ('$USERNAME', '$TIMESTAMP')"

  if [[ $i -lt $NUM_USERS ]]; then
    SQL+=","
  fi
done

SQL+=";"

# Execute SQL in PostgreSQL
echo "$SQL" | psql -U "$DB_USER" -d "$DB_NAME" -h "$DB_HOST" -p "$DB_PORT"

echo "✅ Successfully inserted $NUM_USERS users!"
