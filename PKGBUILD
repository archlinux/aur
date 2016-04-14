# Maintainer=rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# modelio-bin
# Contributing: https://github.com/rafaelsoaresbr/modelio-bin.git
# Builds: https://gitlab.com/rafaelsoaresbr/modelio-bin/builds
#pkgbase=
pkgname=modelio-bin

# Version
pkgver=3.4.1
pkgrel=3
#epoch=

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
source_i686=("http://sourceforge.net/projects/modeliouml/files/3.4.1/modelio-open-201512081403-linux.gtk.x86.tar.gz/download")
source_x86_64=("http://sourceforge.net/projects/modeliouml/files/3.4.1/modelio-open-201512081403-linux.gtk.x86_64.tar.gz/download")
#noextract=()
#validpgpkeys=()

# Integrity
md5sums=('SKIP')
md5sums_i686=('0e698d5bef02e0981912c1f6fdc3f98b')
md5sums_x86_64=('715bf11e8b935254795c8d6f8086131b')
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
    cp -ru $srcdir/Modelio\ 3.4/* "$pkgdir/opt/modelio/"
}
