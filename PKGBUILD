# Maintainer: rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# modelio-bin
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds
#pkgbase=
pkgname=modelio-bin

# Version
pkgver=3.5.1.a
pkgrel=1
#epoch=
_ver=3.5
_timestamp=201607131846

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
source_i686=("modelio-${pkgver}-i686::https://sourceforge.net/projects/modeliouml/files/${pkgver}/modelio-open-${_timestamp}-linux.gtk.x86.tar.gz/download")
source_x86_64=("modelio-${pkgver}-x86_64::https://sourceforge.net/projects/modeliouml/files/${pkgver}/modelio-open-${_timestamp}-linux.gtk.x86_64.tar.gz/download")
#noextract=()
#validpgpkeys=()

# Integrity
#md5sums=
#sha1sums=()
sha256sums=('6b90872f1ddcfba5db33b56d115334220c5a081d04bbf80cc0b9f7227a0104ac'
            'd6009847389012b96c5b2f36358acd93a260236e5449739c41727f64c696b5db')
sha256sums_i686=('ffe5d0df932512d46c9cc8087ae927f34a4aaf1859eb981dfa76e578d806be63')
sha256sums_x86_64=('7769bca6e8ae924667809131a7a405cb735a8dc317eb964d2b113e1c26d3f2dc')

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
