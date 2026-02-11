#!/bin/bash

source $PWD/PKGBUILD
for url in $(echo ${source[@]}|xargs -n1|grep "git+")
do
    echo $url
    DIR=${url##*/}
    if [[ -z $DIR ]];then
        DIR=${url%/}
        DIR=${DIR##*/}
    fi
    COMMIT=${DIR#*commit=}
    COMMIT=${COMMIT%\?*}
    DIR=${DIR%#commit=*}
	if [[ "$DIR" =~ "#tag" ]]; then
        TAG=${DIR#*tag=}
        TAG=${TAG%\?*}
        DIR=${DIR%#tag=*};
        COMMIT=$TAG
    fi
    DIR=${DIR%.git}
    URL=${url%\#*=*}
    if [[ ! $url =~ ^git\+ ]];then
        URL=${URL#*::}
        DIR=${url%::*}
        DIR=${DIR%.git*}
    fi
    URL=${URL#git+}
    echo "URL:" $URL
    echo "DIR:" $DIR
    echo "COMMIT:" $COMMIT
    echo "TAG:" $TAG
    [ ! -d $DIR ] && ( echo git clone --mirror --filter=tree:0 $URL $DIR; git clone --mirror --filter=tree:0 $URL $DIR )
    (cd $DIR;git fetch ;git worktree add tmp $COMMIT;git worktree remove tmp;git worktree add tmp;git worktree remove tmp)
done

