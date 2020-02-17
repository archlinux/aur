#!/bin/bash

while read LINE
    do rm -rv $LINE
done < .gitignore

# Also clean git hooks installed by Husky
rm -rfv .git/hooks/*
