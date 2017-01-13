#!/bin/sh
cp -r /opt/logic2010 $HOME/.config
cd $HOME/.config/logic2010
java -Droot.dir="." -Dlink.dir="." -Dprog.dir="." -Dconfig.dir="." -jar logic.jar
