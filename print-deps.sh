#!/bin/bash

#
# Helper script which prints ejabberd deps' urls including commit hash
#

cd src/ejabberd-*/config && cd ..

if [ ! -d deps ]; then
	[ -x configure ] || ./autogen.sh
	./configure --enable-all
	make deps || exit 1
fi

cd deps ; ls -1 | while read g; do
	test -d $g && \
	pushd $g &>/dev/null
	if [ $? -eq 0 ]; then
		U=`grep 'url =' .git/config | cut -f2 -d= | tr -d ' '`
		C=`git rev-parse HEAD`
		N=`basename $(pwd)`
		echo -e "\t\"$N::$U#commit=$C\""
	fi
	popd &>/dev/null
done | sed 's|https://|git://|' >PKGBUILD.inc

cat PKGBUILD.inc | cut -f2 -d'"' | cut -f1 -d: | tr '\n' ' ' >PKGBUILD.inc2
