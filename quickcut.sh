#!/usr/bin/sh

# target dir
tdir=${HOME}/quickcut
# make temp dir
if [ ! $tdir ];then
	install -dm755 $tdir
fi

# copy needed files
if [ ! -d $tdir/languages ];then
	cp -r /usr/lib/quickcut/languages $tdir
fi

if [ ! -f $tdir/icon.icon ];then
	cp  /usr/lib/quickcut/icon.icns $tdir
fi

if [ ! -f $tdir/style.css ];then
	cp  /usr/lib/quickcut/style.css $tdir
fi

# change dir && exec
cd $tdir && exec /usr/lib/quickcut/QuickCut.py
