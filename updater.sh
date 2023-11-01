#!/bin/bash

wget -O PKGBUILD.new "https://raw.githubusercontent.com/arkane-systems/bottle-imp/master/PKGBUILD" 2>/dev/null
diff -q PKGBUILD PKGBUILD.new > /dev/null
if [[ $? == 0 ]]; then
	echo "No updates"
	rm PKGBUILD.new 
else
	echo "New pkgver, updating and commiting"
	mv PKGBUILD{.new,}
	export $(grep -m 1 pkgver PKGBUILD)
	git add PKGBUILD
	git commit -m "Updating PKGBUILD to ${pkgver}"
	git push
fi
