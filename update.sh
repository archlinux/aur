#! /bin/sh

AUR_NAME=sublime-music
PROJ_NAME=sublime-music
DESCRIPTION="A native Subsonic/Airsonic/*sonic client for Linux. Build using Python and GTK+."
URL=https://gitlab.com/sumner/sublime-music
DEPENDS=(
    python-bottle
    python-dateutil
    python-deepdiff
    python-deprecated
    python-fuzzywuzzy
    python-gobject
    python-keyring
    python-levenshtein
    python-mpv
    python-pychromecast
    python-requests
    python-yaml
    libnm-glib
    libnotify
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
    https://files.pythonhosted.org/packages/source/${PROJ_NAME:0:1}/${PROJ_NAME}/${PROJ_NAME}-$1.tar.gz
    https://gitlab.com/sumner/sublime-music/-/jobs/artifacts/v$1/download?job=build_logo
)

rm -rf 'download?job=build_logo'

printf '' > PKGBUILD
echo "# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='${AUR_NAME}'
pkgname=('${AUR_NAME}')
_module='${PROJ_NAME}'
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
makedepends=(
    'python-setuptools'
    'inkscape'
    'make'
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
    pushd \${srcdir}

    pushd \"\${_module}-\${pkgver}\"
    python setup.py install --root=\"\${pkgdir}\" --optimize=1 --skip-build
    popd

    desktop-file-install --dir=\${pkgdir}/usr/share/applications sublime-music.desktop

    pushd docs/logo/build
    install -Dm644 16x16.png \${pkgdir}/usr/share/icons/hicolor/16x16/apps/sublime-music.png
    install -Dm644 22x22.png \${pkgdir}/usr/share/icons/hicolor/22x22/apps/sublime-music.png
    install -Dm644 32x32.png \${pkgdir}/usr/share/icons/hicolor/32x32/apps/sublime-music.png
    install -Dm644 36x36.png \${pkgdir}/usr/share/icons/hicolor/36x36/apps/sublime-music.png
    install -Dm644 48x48.png \${pkgdir}/usr/share/icons/hicolor/48x48/apps/sublime-music.png
    install -Dm644 64x64.png \${pkgdir}/usr/share/icons/hicolor/64x64/apps/sublime-music.png
    install -Dm644 72x72.png \${pkgdir}/usr/share/icons/hicolor/72x72/apps/sublime-music.png
    install -Dm644 96x96.png \${pkgdir}/usr/share/icons/hicolor/96x96/apps/sublime-music.png
    install -Dm644 128x128.png \${pkgdir}/usr/share/icons/hicolor/128x128/apps/sublime-music.png
    install -Dm644 192x192.png \${pkgdir}/usr/share/icons/hicolor/192x192/apps/sublime-music.png
    install -Dm644 512x512.png \${pkgdir}/usr/share/icons/hicolor/512x512/apps/sublime-music.png
    install -Dm644 1024x1024.png \${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/sublime-music.png
    popd

    popd
}" >> PKGBUILD

updpkgsums
makepkg --printsrcinfo > .SRCINFO

# Test
makepkg -f
