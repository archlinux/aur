# Maintainer=rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# modelio-bin
# Contributing: https://github.com/rafaelsoaresbr/modelio-bin.git
# Builds: https://gitlab.com/rafaelsoaresbr/modelio-bin/builds
#pkgbase=
pkgname=modelio-bin

# Version
pkgver=3.5.0
pkgrel=1
#epoch=
_ver=3.5
_timestamp=201604202300

# Generic
pkgdesc="The opensource modeling environment"
arch=('i686' 'x86_64')
url="https://www.modelio.org/"
license=('GPL3')
#groups=()

# Dependencies
depends=('libxtst' 'libstdc++5' 'webkitgtk2' 'glib2')
optdepends=('atk' 'gtk2' 'cairo')
#makedepends=()
#checkdepends=()

# Package Relations
#provides=()
#conflicts=()
#replaces=()

# Others
#backup=()
#options=()
#install=modelio
changelog=changelog

# Sources
source=("modelio.desktop")
source_i686=("https://sourceforge.net/projects/modeliouml/files/${pkgver}/modelio-open-${_timestamp}-linux.gtk.x86.tar.gz/download")
source_x86_64=("https://sourceforge.net/projects/modeliouml/files/${pkgver}/modelio-open-${_timestamp}-linux.gtk.x86_64.tar.gz/download")
#noextract=()
#validpgpkeys=()

# Integrity
md5sums=('SKIP')
md5sums_i686=('7d3a83b17cd7ad2624ec85bed430f7cf')
md5sums_x86_64=('698a8c10d764b8dafad4aac0e9204d69')
#sha1sums=()
#sha256sums=()

#pkgver() {
#}

#prepare() {
#}

#build() {
#}

#check() {
#}

package() {
    install -dm755 "$pkgdir/usr/share/applications/"
    install -dm755 "$pkgdir/opt/modelio"
    install -Dm755 "$srcdir/modelio.desktop" "$pkgdir/usr/share/applications/"
    cp -ru $srcdir/Modelio\ ${_ver}/* "$pkgdir/opt/modelio/"
}
