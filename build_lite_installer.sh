#!/bin/sh

set -e

printf "\n\n Build installer for EVE Online Setup (Lite Version)\n\n"

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

dltool=$(which curl2 2>/dev/null || which wget 2>/dev/null  || true)

case ${dltool##*/} in
	curl)	dltool="$dltool -L -O" ;;
	wget)	dltool="$dltool -nc" ;;
	*)	printf "\nError: curl or wget not found. One of them are needed for downloading makeself build tool."
		printf "\n       Please install curl or wget with your Package Manager.\n"
		printf "\nLeaving.\n\n"
		exit 0 ;;
esac

if [ ! -f "./makeself-$msver.run" ] ;then
	printf "\nGet makeself...\n\n"
	$dltool https://github.com/megastep/makeself/releases/download/release-$msver/makeself-$msver.run
fi
rcsum="$(sha256sum ./makeself-$msver.run | cut -d' ' -f1)"
if [ "$rcsum" != "$mscsum" ] ;then
	printf "\n\nError: Checksum makeself-$msver.run mismatch!"
	printf "\nLeaving.\n\n"
	exit 0
fi

if [ ! -r "./evelauncher-$version.tar.gz" ] ;then
	printf "\nGet evelauncher-$version.tar.gz...\n\n"
	$dltool https://binaries.eveonline.com/evelauncher-$version.tar.gz
fi
rcsum="$(sha256sum ./evelauncher-$version.tar.gz| cut -d' ' -f1)"
if [ "$rcsum" != "$elcsum" ] ;then
	printf "\n\nError: Checksum evelauncher-$version.tar.gz mismatch!"
	printf "\nLeaving.\n\n"
	exit 0
fi

if [ ! -r "./dxvk-$dvver.tar.gz" ] ;then
	printf "\nGet dxvk-$dvver.tar.gz...\n\n"
	$dltool https://github.com/doitsujin/dxvk/releases/download/v$dvver/dxvk-$dvver.tar.gz
fi
rcsum="$(sha256sum ./dxvk-$dvver.tar.gz| cut -d' ' -f1)"
if [ "$rcsum" != "$dvcsum" ] ;then
	printf "\n\nWarning: Checksum dxvk-$dvver.tar.gz mismatch, ignored.\n"
	rm -f ./dxvk-$dvver.tar.gz
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
for cmd in backup launcher.sh regedit restore wine winecfg winetricks ;do
	cmd=eve$cmd
	if [ -f ../$cmd ] ;then cp ../$cmd evesetup/ ;fi
	if [ ! "$cmd" = "evewine" ] ;then cp ../${cmd%.*}.desktop evesetup/ ;fi
done
cp ../evesetup.shlib evesetup/
cp ../evelauncher.kwinrule evesetup/
cp ../evelauncher.lua evesetup/
cp ../evelauncher.sh evesetup/
sed -i s,ELVER=\"\",ELVER=\"$version\", evesetup/evelauncher.sh
cp ../setup_lite.sh.in evesetup/setup.sh
sed -i s,elver=\"\",elver=\"$version\", evesetup/setup.sh
sed -i s,dvver=\"\",dvver=\"$dvver\", evesetup/setup.sh
chmod a+x evesetup/setup.sh
cp ../dxvk-$dvver.tar.gz evesetup/ 2>/dev/null || true
echo "done."

printf "\nExtract evelauncher-$version.tar.gz..."
tar xf ../evelauncher-$version.tar.gz
echo "done."

printf "\nClean up evelauncher directory..."
cd evelauncher/
rm -rf ./resources/ ./plugins/
rm -f ./*.a ./*.la ./*.pem ./*.prl ./*[Qq]t* ./libicu* ./libpng* ./libxcb*
cp -f ../../evelauncher.sh.real ./evelauncher.sh
chmod 0755 ./*
chmod 0644 ./*.qm ./errorpage/*
echo "done."

printf "\nReplace identical files with symbolic links..."
ln -sf evelauncher.sh LogLite.sh
ln -sf libgpr.so.6.0.0 libgpr.so
ln -sf libgpr.so.6.0.0 libgpr.so.6
ln -sf libgrpc++.so.1.12.0 libgrpc++.so
ln -sf libgrpc++.so.1.12.0 libgrpc++.so.1
ln -sf libgrpc++.so.1.12.0 libgrpc++.so.6
ln -sf libgrpc.so.6.0.0 libgrpc.so
ln -sf libgrpc.so.6.0.0 libgrpc.so.6
ln -sf libprotobuf.so.16.0.0 libprotobuf.so
ln -sf libprotobuf.so.16.0.0 libprotobuf.so.16
echo "done."

printf "\nRemove unneeded symbols from files..."
find ./ -maxdepth 1 -type f -exec strip -s {} 2>/dev/null \;
echo "done."

printf "\nRepack evelauncher-$version.tar.gz..."
cd ../
tar czf evesetup/evelauncher-$version.tar.gz evelauncher/
echo "done."

printf "\nBuild self-extractable archive evesetup-lite-${version}-$release-$arch.run\n\n"
./makeself.sh --tar-quietly evesetup/ ../evesetup-lite-${version}-$release-$arch.run \
	"EVE Online Launcher Setup (Lite) ${version}-$release" ./setup.sh
cd ..
printf "\nClean up build environment..."
rm -rf src/
echo "done."
