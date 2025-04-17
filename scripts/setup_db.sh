#!/bin/bash

# Database details
DB_NAME="vts"
DB_USER="vts_admin"
DB_PASSWORD="admin123" # Change this to a secure password
SUPERUSER="postgres" # Replace with your PostgreSQL superuser username if it's different

# Check if psql is installed
if ! command -v psql &> /dev/null
then
    echo "Error: psql command not found. Please install PostgreSQL client tools."
    exit 1
fi

# Function to execute SQL commands
execute_sql() {
    local sql="$1"
    psql -U "$SUPERUSER" -d postgres -c "$sql"
}

# Create the user if it doesn't exist
if ! execute_sql "SELECT 1 FROM pg_roles WHERE rolname='$DB_USER';" | grep -q "1"; then
    echo "Creating user: $DB_USER"
    execute_sql "CREATE USER \"$DB_USER\" WITH PASSWORD '$DB_PASSWORD';"
else
    echo "User '$DB_USER' already exists."
fi

# Create the database if it doesn't exist
if ! execute_sql "SELECT 1 FROM pg_database WHERE datname='$DB_NAME';" | grep -q "1"; then
    echo "Creating database: $DB_NAME"
    execute_sql "CREATE DATABASE \"$DB_NAME\";"
else
    echo "Database '$DB_NAME' already exists."
fi

# Grant privileges to the user
echo "Granting privileges to user '$DB_USER' on database '$DB_NAME'"
execute_sql "GRANT ALL PRIVILEGES ON DATABASE \"$DB_NAME\" TO \"$DB_USER\";"
execute_sql "GRANT USAGE ON SCHEMA public TO \"$DB_USER\";"

echo "Database '$DB_NAME' and user '$DB_USER' have been created and configured."
