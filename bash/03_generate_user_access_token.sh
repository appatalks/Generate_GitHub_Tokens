# NOTE: User must first authorize App and grab "code=<CODE_STRING>" from redirect URL.
# https://github.com/login/oauth/authorize?client_id=<APP_CLIENT_ID>
# Time Limit a few minutes

# Generates a ghu_* User-to-Server Token.
# Time Limit 8 Hours

# Generates a ghr_* Refresh Token
# Time Limit 6 Months

# Usage:
# bash run.sh <CLIENT_ID> <CLIENT_SECRET> <CODE>

#!/bin/bash

CLIENT_ID=$1
CLIENT_SECRET=$2
CODE=$3

# Use curl to make the POST request
curl -X POST \
  -H "Accept: application/json" \
  -d "client_id=$CLIENT_ID&client_secret=$CLIENT_SECRET&code=$CODE" \
  https://github.com/login/oauth/access_token
