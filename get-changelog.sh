#!/bin/sh

set -xe

curl -O --location https://github.com/mozilla/agithub/raw/v$1/CHANGELOG.md
