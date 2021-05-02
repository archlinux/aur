#!/bin/sh

set -e

printf "\n\n Build installer for EVE Online Setup\n\n"

version=$(grep ^pkgver PKGBUILD | cut -d= -f2) || exit 1
release=$(grep ^pkgrel PKGBUILD | cut -d= -f2) || exit 1
arch=$(uname -m)

csum() {
	sha=$(grep -n ^sha256sum PKGBUILD | cut -d: -f1)
	src=$(grep -n ^source PKGBUILD | cut -d: -f1)
	sln=$(grep -n $1\" PKGBUILD | cut -d: -f1)
	ofs=$(expr $sln - $src)
	cln=$(expr $sha + $ofs)
	printf $(tail -n+$cln PKGBUILD | head -n1 | tr -cd '[:alnum:]')
}

dvver=$(grep doitsujin PKGBUILD | sed 's,.*-,,;s,.tar.*,,' )
msver=$(grep makeself PKGBUILD | sed 's,.*-,,;s,.run.*,,' )

dvcsum=$(csum dxvk-$dvver.tar.gz)
elcsum=$(csum evelauncher-\${pkgver}.tar.gz)
mscsum=$(csum makeself-$msver.run)

if [ ! -x "$(which curl 2>/dev/null)" ] ;then
	printf "\nError: Curl not found. Curl are needed for downloading makeself build tool."
	printf "\n\tPlease install curl with your Package Manager.\n"
	printf "\nLeaving.\n\n"
	exit 0
fi

if [ ! -f "./makeself-$msver.run" ] ;then
	printf "\nGet makeself...\n\n"
	curl -L -O https://github.com/megastep/makeself/releases/download/release-$msver/makeself-$msver.run
fi
rcsum="$(sha256sum ./makeself-$msver.run | cut -d' ' -f1)"
if [ "$rcsum" != "$mscsum" ] ;then
	printf "\n\nError: Checksum makeself-$msver.run mismatch!"
	printf "\nLeaving.\n\n"
	exit 0
fi

printf "\nCreate clean build environment..."
if [ -d src/ ] ;then rm -rf src/* ;else mkdir src/ ;fi

chmod a+x ./makeself-$msver.run
./makeself-$msver.run --tar x ./makeself.sh ./makeself-header.sh 2>/dev/null
chmod a-x ./makeself-$msver.run
mv ./makeself.sh ./makeself-header.sh src/

cd src/
mkdir evesetup/
echo "done."

printf "\nCopy needed files from AUR source..."
for eia in ../eve-icons*.tar.gz ;do tar xf $eia -C evesetup/ ;done
for eta in ../eve-transl5.12-??.tar.gz ;do cp $eta evesetup/ ;done
for cmd in backup launcher.sh regedit restore wine winecfg winetricks ;do
	cmd=eve$cmd
	if [ -f ../$cmd ] ;then cp ../$cmd evesetup/ ;fi
	if [ ! "$cmd" = "evewine" ] ;then cp ../${cmd%.*}.desktop evesetup/ ;fi
done
cp ../evesetup.shlib evesetup/
cp ../evelauncher.kwinrule evesetup/
cp ../evelauncher.lua evesetup/
cp ../evelauncher.sh.in evesetup/evelauncher.sh
cp ../evelauncher.sh.real evesetup/
sed -i s,ELVER=\"\",ELVER=\"$version\", evesetup/evelauncher.sh
cp ../setup.sh.in evesetup/setup.sh
sed -i s,elver=\"\",elver=\"$version\", evesetup/setup.sh
sed -i s,elcsum=\"\",elcsum=\"$elcsum\", evesetup/setup.sh
sed -i s,dvver=\"\",dvver=\"$dvver\", evesetup/setup.sh
sed -i s,dvcsum=\"\",dvcsum=\"$dvcsum\", evesetup/setup.sh
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
if [ -f "../dxvk-$dvver.tar.gz" ] ;then
	printf "\nFound DXVK archive..."
	rcsum="$(sha256sum ../dxvk-$dvver.tar.gz | cut -d' ' -f1)"
	if [ "$rcsum" = "$dvcsum" ] ;then
		cp ../dxvk-$dvver.tar.gz evesetup/ && \
		echo "added."
	else
		echo "skipped, checksum mismatch."
	fi
else
	printf "\nDXVK archive not found, will be downloaded during the setup process.\n"
fi
printf "\nCreate self-extractable archive evesetup-$version-$release-$arch.run\n\n"
./makeself.sh --tar-quietly evesetup/ ../evesetup-$version-$release-$arch.run \
	"EVE Online Launcher Setup $version-$release" ./setup.sh
cd ..
printf "\nClean up build environment..."
rm -rf src/
echo "done."
