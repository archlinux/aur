# Maintainer: Gil Forsyth <gilforsyth@gmail.com> 

pkgname=xrectsel
pkgver=1.0
pkgrel=1
pkgdesc="a small program that tells you the geometry of a rectangular screen region selected with the mouse"
license=('unknown')
arch=('i686' 'x86_64')
url="https://github.com/lolilolicon/xrectsel"
source=(git://github.com/lolilolicon/xrectsel.git)
md5sums=('SKIP')
depends=('libx11')
makedepends=('git')

build() {
    cd "${pkgname}"
    ./bootstrap
    ./configure --prefix /usr
    make
}
package() {
    cd "${pkgname}"
    install -Dm 755 xrectsel "${pkgdir}"/usr/bin/xrectsel
}

