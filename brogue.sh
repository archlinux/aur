#!/bin/sh

groups | grep -w games > /dev/null || ( echo 'You must be a member of the group games'; exit )

pushd /usr/share/brogue/ > /dev/null
./brogue "$@"
popd > /dev/null

