#!/bin/bash
git ls-tree --name-only master | xargs cp -ut aur/
