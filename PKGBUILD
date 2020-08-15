# Maintainer: Jesse Lentz <jesselnz@gmail.com>

pkgname=iwgtk
pkgver=0.3
pkgrel=1
pkgdesc='Lightweight, graphical wifi management utility'
arch=(x86_64)
url='https://github.com/J-Lentz/iwgtk'
license=(GPL3)
depends=(iwd gtk3)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/J-Lentz/iwgtk/archive/v0.3.tar.gz")
sha256sums=(28e39c4a0b0267068ca80697145c137c9ed5acf281ca8bb2ffd2d88b4e2547a8)

build() {
    cd ${pkgname}-${pkgver}
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make prefix=/usr DESTDIR=${pkgdir} install
}
