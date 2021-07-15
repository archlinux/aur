#!/usr/bin/env bash

set -euo pipefail

if [ ${#} -lt 1 ]; then
    echo "Usage: ${0} version"
    echo "Example: ${0} 1.2.3"
    exit 1
fi

version=$1

./update_version.sh ${version}

# Checkout branch from master, add files, and push to GitLab CI
git checkout master
git checkout -b ci-${version}
git add PKGBUILD .SRCINFO
git commit -m "Update to ${version}"
git push gitlab
