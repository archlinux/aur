# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
pkgname=avrcalc
pkgver=0.2
pkgrel=1
pkgdesc="Calculator to speed development of Atmel AVRs"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/smina/"
license=('GPL')
depends=('qt4')
source=("https://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname.tar.gz")
md5sums=('61d35b4ecb8471fb5b8241f4c2e4da99')

build() {
    cd ${srcdir}/${pkgname}
    qmake-qt4 avrcalc.pro
    make
}

package() {
    install -Dm755 ${srcdir}/$pkgname/avrcalc ${pkgdir}/usr/bin/avrcalc
}


