I recently added 2 factor authentication to my GitHub account (and you should too!). However, when I went back to the command line, I could not longer log-in to my account! After doing some searching, it turns out that, with 2FA turned on, you no longer use your password on the command line. Instead, you need to use a personal oauth token. Generating one is super easy, but I wish I had figured this out before hand to save myself the headache of anxiously Googling!

Here are the steps to creating your personal access token:

1. Log into GitHub and access your account settings
2. Select the “Applications” tab on the left-hand navigation
3. Under “Personal Access Tokens” click “create new”
4. Enter a description for your token (so you can keep track and revoke them individually later, should you have a security breach)
5. Copy the token (40 characters long) and use that as your password on the command line.

I should mention that apparently, some apps allow you to enter your 2fa code right in the log-in flow (i believe this holds true for the official GitHub applications)