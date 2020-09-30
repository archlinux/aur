#! /bin/sh

AUR_NAME=sublime-music
PROJ_NAME=sublime-music
PKG_NAME=sublime_music
DESCRIPTION="A native Subsonic/Airsonic/*sonic client for Linux. Built using Python and GTK+."
URL=https://sublimemusic.app
DEPENDS=(
    python-bleach
    python-dataclasses-json
    python-dateutil
    python-deepdiff
    python-fuzzywuzzy
    python-gobject
    python-levenshtein
    python-mpv
    python-peewee
    python-requests
    python-semver
)
LICENSE='GPL3'
ADDITIONAL=

if [[ $# == 0 ]]; then
    echo 'Usage: ./update.sh VERSION_NUMBER'
    exit 1
fi
pkgrel=1
if [[ $# == 2 ]]; then
    pkgrel=$2
fi

SRCS=(
    https://files.pythonhosted.org/packages/source/${PROJ_NAME:0:1}/${PROJ_NAME}/${PKG_NAME}-$1.tar.gz
    https://gitlab.com/sumner/sublime-music/-/archive/v$1/sublime-music-v$1.tar.gz
)

printf '' > PKGBUILD
echo "# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='${AUR_NAME}'
pkgname=('${AUR_NAME}')
_module='${PKG_NAME}'
pkgver='$1'
pkgrel=$pkgrel
pkgdesc='${DESCRIPTION}'
url='${URL}'
depends=(
    'python'" >> PKGBUILD

# Include the dependencies.
for d in ${DEPENDS[*]}; do
    echo "    '$d'" >> PKGBUILD
done

echo ")
optdepends=(
    'libnm-glib: for changing the Subsonic server address depending on what SSID you are connected to'
    'libnotify: for system song notification support'
    'python-keyring: support for storing passwords in the system keyring'
    'python-pychromecast: support for casting to Chromecast devices'
    'python-bottle: support for casting downloaded files to Chromecasts on the same LAN'
)
makedepends=(
    'python-setuptools'
    'python-sphinx'
)
license=('${LICENSE}')
arch=('any')
source=(" >> PKGBUILD

# Include the dependencies.
for s in ${SRCS[*]}; do
    echo "    '$s'" >> PKGBUILD
done

echo ")
md5sums=()
${ADDITIONAL}

build() {
    cd \"\${srcdir}/\${_module}-\${pkgver}\"
    python setup.py build
}

package() {
    pushd \"\${_module}-\${pkgver}\"
    python setup.py install --root=\"\${pkgdir}\" --optimize=1 --skip-build

    # Move all of the package data resources to \${pkgdir}/usr/share/sublime-music
    data_dir=\${pkgdir}/usr/share/sublime-music
    mkdir -p \${data_dir}/adapters/subsonic \${data_dir}/dbus \${data_dir}/ui
    pushd \${pkgdir}/usr/lib/python3.8/site-packages/sublime_music
    mv adapters/icons \${data_dir}/adapters
    mv adapters/images \${data_dir}/adapters
    mv adapters/subsonic/icons \${data_dir}/adapters/subsonic
    mv dbus/mpris_specs \${data_dir}/dbus
    mv ui/icons \${data_dir}/ui
    mv ui/images \${data_dir}/ui
    popd

    popd

    pushd \"${AUR_NAME}-v\${pkgver}\"

    desktop-file-install --dir=\${pkgdir}/usr/share/applications sublime-music.desktop
    install -Dm644 sublime-music.metainfo.xml \"\${pkgdir}/usr/share/metainfo/sublime-music.metainfo.xml\"

    pushd docs
    make man
    install -Dm644 ./_build/man/sublime-music.1 \"\${pkgdir}/usr/share/man/man1/sublime-music.1\"
    popd

    pushd logo/rendered
    for size in 16 22 32 48 64 72 96 128 192 512 1024; do
        install -Dm644 \${size}.png \${pkgdir}/usr/share/icons/hicolor/\${size}x\${size}/apps/sublime-music.png
    done
    popd

    popd  # pkg
}" >> PKGBUILD

updpkgsums
makepkg --printsrcinfo > .SRCINFO

# Test
makepkg -f
