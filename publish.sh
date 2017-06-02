#!/bin/sh

# https://stackoverflow.com/questions/29258603/what-do-0-1-2-mean-in-shell-script
DIR=$(dirname "$0")

cd $DIR/..

if [[ $(git status -s) ]]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi
#
# echo "Deleting old files"
# rm -rf docs
# mkdir docs
# git worktree prune
# rm -rf .git/worktrees/public/
#
# echo "Checking out gh-pages branch into public"
# git worktree add -B gh-pages public upstream/gh-pages
#
# echo "Removing existing files"
# rm -rf public/*
#
# echo "Generating site"
# hugo
#
# echo "Updating gh-pages branch"
# cd public && git add --all && git commit -m "Publishing to gh-pages (publish.sh)"


# ADD RECREATE CNAME
