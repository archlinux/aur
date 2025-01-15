# Maintainer: Blue Gummi <thatstealthyowl@gmail.com> 
pkgname=belle-cpu
pkgver=0.2.0
pkgrel=1
pkgdesc="BELLE - The Big Endian, Low Level Emulator"
arch=('any')
url="https://github.com/BlueGummi/belle.git"
license=('BSD-3-Clause')
depends=('make' 'cargo')
source=("git+https://github.com/BlueGummi/belle.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/belle"
    ./build.sh -w
}

package() {
    cd "$srcdir/belle"
    ./install.sh -c
}
