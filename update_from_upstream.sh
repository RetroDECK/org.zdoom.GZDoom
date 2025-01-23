#!/bin/bash

target_branch="master"
update_submodules="true"

# Get the repository name
repo_url=$(git remote get-url origin)
repo_name=$(basename -s .git "$repo_url")

echo "Fetching https://github.com/flathub/$repo_name $target_branch"
if [ "$update_submodules" = "true" ]; then
    echo "And updating submodules also"
fi
echo ""

# Fetch the latest changes from the remote master branch
git fetch https://github.com/flathub/"$repo_name" "$target_branch"

# Merge the fetched changes into your current branch
git merge FETCH_HEAD

if [ "$update_submodules" = "true" ]; then
    # Update submodules to the versions specified in the repo
    git submodule update --init --recursive

    # Update submodules to the versions specified in the fetched repo
    git submodule update --remote
    git add shared-modules
    git commit -m "Update shared modules"
fi


