#!/bin/bash

date=$(date)

cp ~/PycharmProjects/crazydiskmark/aur/PKGBUILD .
cp ~/PycharmProjects/crazydiskmark/aur/.SRCINFO .

git add PKGBUILD .SRCINFO update.sh

git commit -m "updated $date"

git push
