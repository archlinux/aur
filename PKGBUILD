# Maintainer=rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# Package name
#pkgbase=
pkgname=modelio-bin

# Version
pkgver=3.4.1
pkgrel=1
#epoch=

# Generic
pkgdesc="The opensource modeling environment"
arch=('i686' 'x86_64')
url="https://www.modelio.org/"
license=('GPL3')
#groups=()

# Dependencies
#depends=()
#optdepends=()
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
source_i686=("modelio.desktop" "http://sourceforge.net/projects/modeliouml/files/3.4.1/modelio-open-201512081403-linux.gtk.x86.tar.gz/download")
source_x86_64=("modelio.desktop" "http://sourceforge.net/projects/modeliouml/files/3.4.1/modelio-open-201512081403-linux.gtk.x86_64.tar.gz/download")
#noextract=()
#validpgpkeys=()

# Integrity
md5sums_i686=('SKIP' '0e698d5bef02e0981912c1f6fdc3f98b')
md5sums_x86_64=('SKIP' '715bf11e8b935254795c8d6f8086131b')
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
    mkdir -p $pkgdir/usr/share/applications/
    mkdir -p $pkgdir/opt/
    cp modelio.desktop $pkgdir/usr/share/applications/
	cp -r "$srcdir/Modelio 3.4/" "$pkgdir/opt/modelio"
}
