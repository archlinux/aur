#!/bin/bash

mksrcinfo
updpkgsums
git add *
git commit -am "$@"
git push
