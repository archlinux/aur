#!/bin/bash

if ! command -v gh &> /dev/null
then
    echo "gh could not be found, please install github-cli"
    exit 1
fi

export GITHUB_TOKEN="$(gh auth token)"
exec "/usr/bin/git-work" "$@"