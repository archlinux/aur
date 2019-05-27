#!/bin/sh

# Buildscript for creating the distribution independed installer.
# Works only in this directory because some dependencies are here located.

set -e

version=$(grep ^pkgver PKGBUILD | cut -d= -f2) || exit 1
release=$(grep ^pkgrel PKGBUILD | cut -d= -f2) || exit 1
arch=$(uname -m)

mscsum="ca66a6113ce98152b85c8d847949f8c90ab9ba798e106bfc225d4ed3c2e2e3e2"
rcsum=""

if [ ! -f "./makeself-2.4.0.run" ] ;then
    if [ ! -x "$(which curl)" ] ;then
	echo "Curl not found. Curl are needed for downloading makeself build tool."
	echo " Please install curl with your Package Manager."
	printf "\nExiting.\n\n"
	exit 0
    fi
    printf "\nGet makeself...\n\n"
    curl -L -O https://github.com/megastep/makeself/releases/download/release-2.4.0/makeself-2.4.0.run
fi
rcsum="$(sha256sum ./makeself-2.4.0.run| cut -d' ' -f1)"
if [ "$rcsum" != "$mscsum" ] ;then
    printf "\n\nError: Checksum from makeself-2.4.0.run doesn't match!"
    printf "\nExiting.\n\n"
    exit 0
fi

printf "\nCreate clean build environment..."
if [ -d src/ ] ;then rm -rf src/* ;else mkdir src/ ;fi

chmod a+x ./makeself-2.4.0.run
./makeself-2.4.0.run --tar x ./makeself.sh ./makeself-header.sh 2>/dev/null
chmod a-x ./makeself-2.4.0.run
mv ./makeself.sh ./makeself-header.sh src/

cd src/
mkdir evesetup/
echo "done."

printf "\nCopy needed files from AUR package..."
for eia in $(ls ../eve-icons*.tar.gz) ;do tar xf $eia -C evesetup/ ;done
for eta in $(ls ../eve-transl5.11-??.tar.gz) ;do cp $eta evesetup/ ;done
for cmd in evelauncher.sh everegedit evewine evewinecfg evewinetricks ;do
    if [ -f ../$cmd ] ;then cp ../$cmd evesetup/ ;fi
    if [ ! "$cmd" = "evewine" ] ;then
        cp ../${cmd%.*}.desktop evesetup/
    fi
done
cp -f ../evelauncher.shlib evesetup/evelauncher.shlib
cp -f ../evelauncher.sh.in evesetup/evelauncher.sh
grep -v '^#-' ../setup.sh.in >evesetup/setup.sh
#-- testing only
#- cp -f ../setup.sh.in evesetup/setup.sh
#--
chmod a+x evesetup/setup.sh
if [ -f "../evelauncher-$version.tar.gz" ] ;then cp ../evelauncher-$version.tar.gz evesetup/ ;fi
echo "done."

printf "\nBuild self-extractable archive evesetup-$version-$release-$arch.run\n\n"
./makeself.sh evesetup/ ../evesetup-$version-$release-$arch.run \
    "EVE Online Launcher Setup" ./setup.sh
cd ..
printf "\nClean up build environment..."
rm -rf src/
echo "done."
