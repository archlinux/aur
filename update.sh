#!/bin/bash

date=$(date)

cp ~/PycharmProjects/gonhang/aur/PKGBUILD .
cp ~/PycharmProjects/gonhang/aur/.SRCINFO .

git add PKGBUILD .SRCINFO update.sh

git commit -m "updated $date"

git push
