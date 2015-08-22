#!/bin/bash

PAKFILE=sp_pak_coop1.pk3
ORIGINALFOLDER=$(pwd)

cd media/sp_pak_coop1

zip -r $PAKFILE ./ -x "*.svn*"

mv $PAKFILE ../

echo "Creating bin.pk3"
	cd ../../build/release-linux*
	cd coopmain/
        zip -r bin.pk3 *.so
        mv bin.pk3 ../../../media/

