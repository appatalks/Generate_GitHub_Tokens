# https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/authenticating-to-the-rest-api-with-an-oauth-app
# https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/authorizing-oauth-apps

# 1. Create oAuth App grabbing the ID and Secret
# 2. Run the script, interactively choose what scopes you want
# 3. copy the code=<string>, paste the code string, grab gho_*
# 4. Profit

# Generates a gho_* for OAuth access tokens
# Time Limit 1 Year

# Usage
# bash run.sh <CLIENT_ID> <CLIENT_SECRET>

#!/bin/bash

# Set the required environment variables
CLIENT_ID=$1
CLIENT_SECRET=$2

# Generate a random state variable
state=$(uuidgen)

# Initialize an empty array to store selected scopes
selected_scopes=()

# Prompt the user to select the desired scopes
echo "Select Scope Permissions: "
options=("repo" "user" "admin:org" "admin:org_hook" "admin:repo_hook" "admin:public_key" "admin:gpg_key" "read:org" "security_events" "gist" "notifications" "project" "delete_repo" "write:packages" "read:packages" "delete:packages" "codespace" "workflow")

# Display options
for i in "${!options[@]}"; do
  echo "$((i+1))) ${options[$i]}"
done

# Read selections until an empty line is entered
while true; do
   echo "Enter options (empty to finish): "
   read -a opts
   if [ -z "$opts" ]; then
     break
   fi
   for opt in "${opts[@]}"; do
     if ! [[ $opt =~ ^[0-9]+$ ]] || ((opt < 1 || opt > ${#options[@]})); then
       echo "Invalid selection. Please try again."
     else
       selected_scopes+=("${options[opt-1]}")
     fi
   done
done

# Join the selected scopes with "%20" as the separator
#scopes=$(IFS="%20"; echo "${selected_scopes[*]}")
scopes=$(printf "%s%%20" "${selected_scopes[@]}")

# Generate the authorization URL based on the selected scope
auth_url="https://github.com/login/oauth/authorize?scope=$scopes&client_id=$CLIENT_ID&state=$state"

# Prompt the user to open the authorization URL and retrieve the session code
# Session Code Expires after 10 Minutes!!

# Check if xdg-open command exists
if command -v xdg-open &> /dev/null; then
  # Linux system
  xdg-open "$auth_url"
elif command -v open &> /dev/null; then
  # macOS system
  open "$auth_url"
else
  # Unable to automatically open the URL
  echo "Unable to open the URL in a web browser. Please visit the following URL manually: $auth_url"
fi

read -p "oAuth URL: $auth_url
Enter the code: " session_code

# POST the code back to GitHub to obtain the access token
result=$(curl -s -X POST -H "Accept: application/json" \
     -d "client_id=$CLIENT_ID" \
     -d "client_secret=$CLIENT_SECRET" \
     -d "code=$session_code" \
     "https://github.com/login/oauth/access_token")

# Extract the access token
access_token=$(echo "$result" | jq -r '.access_token')
scopes=$(echo "$result" | jq -r '.scope')

# Use the access token for further API calls
echo "Access Token: $access_token"
echo "Token Scopes: $scopes"

# echo "DEBUG"
# echo "----------"
# echo $result
