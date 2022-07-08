#!/bin/bash
#rm -rf aur/*
git ls-tree --name-only master | xargs cp -ut aur/
