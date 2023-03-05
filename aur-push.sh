#! /bin/bash
if [ -z "$1" ];
    then echo "Please supply a commit message wrapped in single quotes '' before you proceed!";
    else
        makepkg --printsrcinfo > .SRCINFO
        git add .
        git commit -am "$1"
        git push;
fi
