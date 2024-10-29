#!/bin/bash

git submodule init
git submodule update
git fetch https://github.com/flathub/org.zdoom.GZDoom master  # Fetch the latest changes from the remote master branch
git merge FETCH_HEAD  # Merge the fetched changes into your current branch