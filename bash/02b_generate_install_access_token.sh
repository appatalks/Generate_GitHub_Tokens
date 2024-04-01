# Generates a ghs_* Token. GitHub server-to-server tokens.
# https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/generating-an-installation-access-token-for-a-github-app
# Usage:
# bash run.sh <install_ID> <JWT>
# Time Limit 1 Hour

#!/usr/bin/env bash

install_id=$1
jwt=$2

curl --request POST \
--url "https://api.github.com/app/installations/$1/access_tokens" \
--header "Accept: application/vnd.github+json" \
--header "Authorization: Bearer $2" \
--header "X-GitHub-Api-Version: 2022-11-28"
