#!/bin/sh

if [ ! -d "$HOME/.config/logic2010" ]; then
    cp -r /opt/logic2010 $HOME/.config
    mkdir -p $HOME/.config/logic2010/Contents/Resources
    cp -al $HOME/.config/logic2010/* $HOME/.config/logic2010/Contents/Resources
    mkdir $HOME/.config/logic2010/Contents/Java
    ln $HOME/.config/logic2010/logic.jar $HOME/.config/logic2010/Contents/Java/
fi

cd $HOME/.config/logic2010
java -Droot.dir="." -Dlink.dir="." -Dprog.dir="." -Dconfig.dir="." -jar logic.jar
