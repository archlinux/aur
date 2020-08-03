#!/bin/sh

set -e

printf "\n\n Buildscript for the distribution independed installer of"
printf " EVE Online Launcher Setup (Lite)\n\n"

version=$(grep ^pkgver PKGBUILD | cut -d= -f2) || exit 1
release=$(grep ^pkgrel PKGBUILD | cut -d= -f2) || exit 1
arch=$(uname -m)

dvver=$(grep doitsujin PKGBUILD | cut -d\" -f2 | sed 's,.*-,,;s,.tar.*,,' )
dvcsum=""
elcsum=""
mscsum="ca66a6113ce98152b85c8d847949f8c90ab9ba798e106bfc225d4ed3c2e2e3e2"
rcsum=""

pshal=$(grep -n ^sha256sum PKGBUILD | cut -d: -f1)
psrcl=$(grep -n ^source PKGBUILD | cut -d: -f1)
pdvsl=$(grep -n dxvk-$dvver.tar.gz\" PKGBUILD | cut -d: -f1)
pelsl=$(grep -n evelauncher-\${pkgver}.tar.gz\" PKGBUILD | cut -d: -f1)
pdfsl=$(expr $pdvsl - $psrcl)
pofsl=$(expr $pelsl - $psrcl)
pdvcs=$(expr $pshal + $pdfsl)
pelcs=$(expr $pshal + $pofsl)

plc=1
while read pline ;do
    if [ $plc -eq $pdvcs ] ;then
	dvcsum=${pline#*\'}
	dvcsum=${dvcsum%%\'*}
    fi
    if [ $plc -eq $pelcs ] ;then
	elcsum=${pline#*\'}
	elcsum=${elcsum%%\'*}
    fi
    plc=$(expr $plc + 1)
done < PKGBUILD

if [ ! -x "$(which curl 2>/dev/null)" ] ;then
    printf "\nError: Curl not found. Curl are needed for downloading makeself build tool."
    printf "\n\tPlease install curl with your Package Manager.\n"
    printf "\nLeaving.\n\n"
    exit 0
fi

if [ ! -f "./makeself-2.4.0.run" ] ;then
    printf "\nGet makeself...\n\n"
    curl -L -O https://github.com/megastep/makeself/releases/download/release-2.4.0/makeself-2.4.0.run
fi
rcsum="$(sha256sum ./makeself-2.4.0.run | cut -d' ' -f1)"
if [ "$rcsum" != "$mscsum" ] ;then
    printf "\n\nError: Checksum makeself-2.4.0.run mismatch!"
    printf "\nLeaving.\n\n"
    exit 0
fi

if [ ! -r "./evelauncher-$version.tar.gz" ] ;then
    printf "\nGet evelauncher-$version.tar.gz...\n\n"
    curl -L -O https://binaries.eveonline.com/evelauncher-$version.tar.gz
fi
rcsum="$(sha256sum ./evelauncher-$version.tar.gz| cut -d' ' -f1)"
if [ "$rcsum" != "$elcsum" ] ;then
    printf "\n\nError: Checksum evelauncher-$version.tar.gz mismatch!"
    printf "\nLeaving.\n\n"
    exit 0
fi

if [ ! -r "./dxvk-$dvver.tar.gz" ] ;then
    printf "\nDownload dxvk-$dvver.tar.gz...\n\n"
    curl -L -O https://github.com/doitsujin/dxvk/releases/download/v$dvver/dxvk-$dvver.tar.gz
fi
rcsum="$(sha256sum ./dxvk-$dvver.tar.gz| cut -d' ' -f1)"
if [ "$rcsum" != "$dvcsum" ] ;then
    printf "\n\nWarning: Checksum dxvk-$dvver.tar.gz mismatch, ignored.\n"
    rm -f ./dxvk-$dvver.tar.gz
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
touch ./*
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
