#!/bin/bash

date=$(date)

cp ~/PycharmProjects/crazydiskmark/crazydiskmark-aur/* .
cp ~/PycharmProjects/crazydiskmark/crazydiskmark-aur/.SRCINFO .

git add PKGBUILD .SRCINFO update.sh

git commit -m "updated $date"

git push
