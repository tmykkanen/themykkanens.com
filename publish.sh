#!/usr/bin/env bash

# This script allows you to easily and quickly generate and deploy your website
# using Hugo to your personal GitHub Pages repository. This script requires a
# certain configuration, run the `setup.sh` script to configure this. See
# https://hjdskes.github.io/blog/update-deploying-hugo-on-personal-gh-pages/
# for more information. Also https://gohugo.io/tutorials/github-pages-blog/

# Set the English locale for the `date` command.
export LC_TIME=en_US.UTF-8

# The commit message.
MESSAGE="Site rebuild $(date)"

# Function to print commit message.
msg() {
    printf "\033[1;32m :: %s\n\033[0m" "$1"
}

# Check for out-standing changes and exit if so
# if [[ $(git status -s) ]]; then
#      msg "The working directory is dirty, please commit or stash any pending changes"
#      exit 1;
#  fi

# Remove old files & commit changes to master
msg "Removing the old website"
pushd docs
git rm -rf *
git commit -m "Files removed for $MESSAGE"
popd

# Rebuild website
msg "Building the website"
hugo

# Recreate CNAME
msg "Recreating CNAME"
pushd docs
echo www.themykkanens.com >> CNAME

# Commit new files to server
msg "Pushing the updated \`docs\` folder."
git add *
git commit -m "$MESSAGE"
popd
git push origin master
