#!/usr/bin/env bash

# Get the number of commits for a repository using the GitHub API
# Requires curl and jq

# Owner of the repository
repo_owner="LazoCoder"

# Name of the repository
repo_name="Pokemon-Terminal"

# URL for the API request
repo_api_url="https://api.github.com/repos/${repo_owner}/${repo_name}"

# Hashes of the first and the latest commits
# Replace this with the hash of the first commit for your repository
first_commit="767edcee47f4858f455d74621498d8703fcac1c5"

# Hash of the latest commit is fetched through the GitHub API
latest_commit=$(curl -s "$repo_api_url"/git/refs/heads/master | jq -r .object.sha)

# Data returned by the GitHub API in JSON format
github_data=$(curl -s "$repo_api_url"/compare/${first_commit}...${latest_commit})

# Get the value of the total_commits key
num_commits=$(echo "$github_data" | jq -r .total_commits)

# Total number of commits = (value of the total_commits key) + 1
echo $(( num_commits + 1 ))