#!/bin/bash

git config --global user.email "owen.debiasio@gmail.com"
git config --global user.name "Owen Debiasio"

ssh-keygen -t ed25519 -C "owen.debiasio@gmail.com" -f ~/.ssh/id_ed25519

ssh -T aur@aur.archlinux.org
