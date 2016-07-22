# Maintainer: rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# modelio-bin
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds
#pkgbase=
pkgname=modelio-bin

# Version
pkgver=3.5.1
pkgrel=1
#epoch=
_ver=3.5
_timestamp=201607121907

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
source=("modelio.desktop" "changelog")
source_i686=("https://sourceforge.net/projects/modeliouml/files/${pkgver}/modelio-open-${_timestamp}-linux.gtk.x86.tar.gz/download")
source_x86_64=("https://sourceforge.net/projects/modeliouml/files/${pkgver}/modelio-open-${_timestamp}-linux.gtk.x86_64.tar.gz/download")
#noextract=()
#validpgpkeys=()

# Integrity
md5sums=('SKIP' 'SKIP')
md5sums_i686=('cca87cbd999d0b60be24f9e7e2bf90b1')
md5sums_x86_64=('f3401e8ac4ac63773106eeceac830f77')
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
