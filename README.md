# GitHub App Access Token Scripts

This repository contains scripts useful for generating various types of GitHub App tokens.

- [01](bash/01_generate_GH_App_JWT_token.sh) JWT for [JSON Web Token](https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/generating-a-json-web-token-jwt-for-a-github-app)
- [02](bash/02_grab_app_install_id.sh) Needed for install access token [App ID](https://docs.github.com/en/rest/apps/apps?apiVersion=2022-11-28#list-installations-for-the-authenticated-app)
- [03](bash/03_generate_install_access_token.sh) ghs for GitHub [server-to-server tokens](https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/about-authentication-with-a-github-app)
- [04](bash/04_generate_user_access_token.sh) ghu for GitHub [user-to-server tokens](https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/about-authentication-with-a-github-app)
- [05](bash/05_generate_refresh_token.sh) ghr for GitHub [refresh tokens](https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/refreshing-user-access-tokens)
- [06](bash/06_generate_oAuth_app_token.sh) gho for GitHub [oAuth App Token](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/authenticating-to-the-rest-api-with-an-oauth-app)

Usage Instructions and associated Documentation located within.

Bonus Read [Blog Post Here](https://github.blog/2021-04-05-behind-githubs-new-authentication-token-formats/)
