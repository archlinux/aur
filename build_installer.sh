#!/bin/sh

set -e

printf "\n\n Buildscript for creating the distribution independed installer\n"
printf " with all dependencies and optional evelauncher archive included.\n\n"

version=$(grep ^pkgver PKGBUILD | cut -d= -f2) || exit 1
release=$(grep ^pkgrel PKGBUILD | cut -d= -f2) || exit 1
arch=$(uname -m)

elcsum=""
mscsum="ca66a6113ce98152b85c8d847949f8c90ab9ba798e106bfc225d4ed3c2e2e3e2"
rcsum=""

pshal=$(grep -n ^sha256sum PKGBUILD | cut -d: -f1)
psrcl=$(grep -n ^source PKGBUILD | cut -d: -f1)
pelsl=$(grep -n evelauncher-\${pkgver}.tar.gz\" PKGBUILD | cut -d: -f1)
pofsl=$(expr $pelsl - $psrcl)
pelcs=$(expr $pshal + $pofsl)

plc=1
while read pline ;do
    if [ $plc -eq $pelcs ] ;then
	elcsum=${pline#*\'}
	elcsum=${elcsum%%\'*}
    fi
    plc=$(expr $plc + 1)
done < PKGBUILD

if [ ! -f "./makeself-2.4.0.run" ] ;then
    if [ ! -x "$(which curl)" ] ;then
	echo "Curl not found. Curl are needed for downloading makeself build tool."
	echo " Please install curl with your Package Manager."
	printf "\nLeaving.\n\n"
	exit 0
    fi
    printf "\nGet makeself...\n\n"
    curl -L -O https://github.com/megastep/makeself/releases/download/release-2.4.0/makeself-2.4.0.run
fi
rcsum="$(sha256sum ./makeself-2.4.0.run | cut -d' ' -f1)"
if [ "$rcsum" != "$mscsum" ] ;then
    printf "\n\nError: Checksum from makeself-2.4.0.run doesn't match!"
    printf "\nLeaving.\n\n"
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

printf "\nCopy needed files from AUR source..."
for eia in ../eve-icons*.tar.gz ;do tar xf $eia -C evesetup/ ;done
for eta in ../eve-transl5.11-??.tar.gz ;do cp $eta evesetup/ ;done
for cmd in evelauncher.sh everegedit evewine evewinecfg evewinetricks evebackup ;do
    if [ -f ../$cmd ] ;then cp ../$cmd evesetup/ ;fi
    if [ ! "$cmd" = "evewine" ] ;then cp ../${cmd%.*}.desktop evesetup/ ;fi
done
cp ../evesetup.shlib evesetup/evesetup.shlib
cp ../evelauncher.sh.in evesetup/evelauncher.sh
sed -i s,ELVER=\"\",ELVER=\"$version\", evesetup/evelauncher.sh
cp ../setup.sh.in evesetup/setup.sh
sed -i s,elver=\"\",elver=\"$version\", evesetup/setup.sh
sed -i s,elcsum=\"\",elcsum=\"$elcsum\", evesetup/setup.sh
chmod a+x evesetup/setup.sh
echo "done."

if [ -f "../evelauncher-$version.tar.gz" ] ;then
    printf "\nFound EVE Launcher archive..."
    rcsum="$(sha256sum ../evelauncher-$version.tar.gz | cut -d' ' -f1)"
    if [ "$rcsum" = "$elcsum" ] ;then
	cp ../evelauncher-$version.tar.gz evesetup/ && \
	echo "added."
    else
	echo "skipped, checksum mismatch."
    fi
else
    printf "\nEVE Launcher archive not found, will be downloaded during the setup process.\n"
fi

printf "\nBuild self-extractable archive evesetup-$version-$release-$arch.run\n\n"
./makeself.sh --tar-quietly evesetup/ ../evesetup-$version-$release-$arch.run \
    "EVE Online Launcher Setup $version-$release" ./setup.sh
cd ..
printf "\nClean up build environment..."
rm -rf src/
echo "done."
