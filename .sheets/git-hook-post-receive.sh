#!/bin/bash -e

# Variables and utility functions
NPM_LOG="/home/srijan/Documents/klozee/npm.log"
GIT_DIR="/home/srijan/Documents/klozee/production"
WORK_TREE="/home/srijan/Documents/klozee/deploy"

log() {
    echo " [ $(date -R) ] $@"
}

# Print to the log file
log "Start post-receive script"

# Killing all node processes
log "Kill all node processes"
pkill node || true  # If node process is running then the script exits, hence 'true'

# Checkout the code to deploy folder
log "Checkout code to $WORK_TREE"
git --work-tree="$WORK_TREE" --git-dir="$GIT_DIR" checkout -f

# Load npm if not found
hash npm &> /dev/null || source "$HOME/.nvm/nvm.sh"

# Move to $WORK_TREE
log "install node dependencies"
cd "$WORK_TREE"
npm install

# Start server
log "Starting server"
npm run deploy &>$NPM_LOG &

# End of script
log "Stop post-receive script"
