#!/bin/bash

# Usage:
# bash run.sh JWT

# JWT
JWT=$1

# Make the API request to GitHub
INSTALLATION_ID=$(curl -s -L \
  -H "Authorization: Bearer $JWT" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  https://api.github.com/app/installations | grep id | awk '{print $2}' | sed 's/,//g' | head -n1)

# Print the installation ID
echo "Installation ID: $INSTALLATION_ID"
