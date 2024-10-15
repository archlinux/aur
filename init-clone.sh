#!/bin/bash

source $PWD/PKGBUILD
for url in $(echo ${source[@]}|xargs -n1|grep "^git"|sed -e 's/git+//' -e 's/#commit=.*//')
do
    d=${url##*/}
    d=${d%.git}
    git clone --filter=tree:0 $url $d
    (cd $d;git worktree add tmp;git worktree remove tmp;git branch -d tmp)
done

