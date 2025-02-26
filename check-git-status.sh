#!/bin/bash

# Directory to start the search
start_dir="."

# Function to check for uncommitted changes
check_git_status() {
    if [ -d ".git" ]; then
        echo "Checking $(pwd)"
        if ! git diff-index --quiet HEAD --; then
            echo "*** Uncommitted changes found in $(pwd)"
        else
            echo "No uncommitted changes in $(pwd)"
        fi
    fi
}

# Export the function so it can be used by find
export -f check_git_status

# Find all subdirectories and check for uncommitted changes
find "$start_dir" -type d -exec bash -c 'cd "$0" && check_git_status' {} \;

echo "Backup check complete."
