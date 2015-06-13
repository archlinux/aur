#!/bin/sh
if [ ! -e ~/xnec2c/examples ]; then
	mkdir -p ~/xnec2c/examples &> /dev/null
	cp -a /usr/share/xnec2c/examples/* ~/xnec2c/examples/
fi
pushd . &> /dev/null
cd ~/xnec2c
xnec2c
popd
