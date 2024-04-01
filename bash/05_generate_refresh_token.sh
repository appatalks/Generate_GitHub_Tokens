# Generate a ghr_* Refresh Token.
# https://docs.github.com/en/enterprise-cloud@latest/apps/creating-github-apps/authenticating-with-a-github-app/refreshing-user-access-tokens
# Usage:
# bash run.sh <CLIENT_ID> <CLIENT_SECRET> <REFRESH_TOKEN>
# Time Limit 6 Months

#!/bin/bash

CLIENT_ID=$1
CLIENT_SECRET=$2
GRANT_TYPE="refresh_token"
REFRESH_TOKEN=$3

# Use curl to make the POST request
curl -X POST \
  -H "Accept: application/json" \
  -d "client_id=$CLIENT_ID&client_secret=$CLIENT_SECRET&grant_type=$GRANT_TYPE&refresh_token=$REFRESH_TOKEN" \
  https://github.com/login/oauth/access_token
