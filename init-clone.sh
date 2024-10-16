#!/bin/bash

source $PWD/PKGBUILD
for url in $(echo ${source[@]}|xargs -n1|grep "git+")
do
    DIR=${url##*/}
    COMMIT=${DIR#*commit=}
    DIR=${DIR%.git*}
    URL=${url%.git*}.git
    if [[ ! $url =~ ^git\+ ]];then
        URL=${URL#*::}
        DIR=${url%::*}
    fi
    URL=${URL#git+}
    echo $URL
    echo $DIR
    echo $COMMIT
    git clone --filter=tree:0 $URL $DIR
    (cd $DIR;git worktree add tmp $COMMIT;git worktree remove tmp)
done

