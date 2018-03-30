#!/usr/bin/env sh

###
###   Generate a version number for packaging cpplint
###

start="$PWD"
mirror="$PWD/styleguide.mirror"
working="$PWD/styleguide.workdir"

# clone or update mirror styleguide repo
if [ ! -d "$mirror" ]; then
    git clone --mirror "https://github.com/google/styleguide" "$mirror"
else
    cd "$mirror" || exit
    git remote update
    cd "$start" || exit
fi

# delete styleguide repo if it exists
if [ -d "$working" ] && [ -d "$working/.git" ]; then
    rm -rf "$working"
fi

# clone new styleguide repo
git clone "$mirror" "$working"
cd "$working" || exit

# make new branch
git checkout -b cpplint

# filter cpplint subdirectory
git filter-branch --prune-empty --subdirectory-filter cpplint

# ensure no tags exist
numtags="$(git tag|wc -l)"
if [ "$numtags" -gt 0 ]; then
    printf "\n%s" "aborting, some tags already exist"
    exit 1
fi

# create tags for commits that mention a revision number
for commit in $(git rev-list cpplint); do
    firstline=$(git log --format="%B" -n 1 $commit|head -n1)
    revision="$(echo "$firstline"|grep -P -o '(?<=Update cpplint.py to [#r])\d+(?=:|$)')"
    if [ $? -eq 0 ]; then
        git tag -a "$revision" "$commit" -m "automatically created tag for cpplint $revision"
    fi
done

# print latest version
printf "\nlatest version: %s" "$(git describe | sed 's/\([^-]*-\)g/r\1/;s/-/./g'|cut -f 1-2 -d.)"

# print latest commit
cd "$mirror"
printf "\nlatest commit: %s\n" "$(git log --max-count=1 --format="%H" -- cpplint)"

# clean up
cd "$start" || exit
rm -rf "$working"
