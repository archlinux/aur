#!/usr/bin/env bash

git remote add aur ssh://aur@aur.archlinux.org/pman-helper.git
git push origin main
git push aur main:master
