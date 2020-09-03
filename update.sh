#!/bin/bash

date=$(date)

git add PKGBUILD .SRCINFO update.sh

git commit -m "updated $date"

git push
