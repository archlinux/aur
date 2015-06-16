# Author: Thomas Lübking <thomas.luebking at gmail>
# Maintainer: Esclapion <esclapion[at]gmail[dot]com>

pkgname=qarma
pkgver=1.0
pkgrel=1
pkgdesc="A drop-in replacement clone for zenity, written in Qt4/5"
arch=('i686' 'x86_64')
url="https://github.com/luebking/qarma"
license=('GPL')
groups=()
depends=('qt5-base')
makedepends=('gcc')
license=('GPL')
provides=('qarma')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("qarma-1.0.tar.gz")
sha256sums=('369a8e00dd163951bf756290bc36362190fcb6e8ebd650990c6e54dff6b2d375')

build()
{
    cd $srcdir/$pkgname-$pkgver
    qmake
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    strip qarma
    mkdir -p $pkgdir/usr/bin
    cp qarma $pkgdir/usr/bin
}
