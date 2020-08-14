# Maintainer: Jesse Lentz <jesselnz@gmail.com>

pkgname=iwgtk
pkgver=0.2
pkgrel=1
pkgdesc='Lightweight, graphical wifi management utility'
arch=(x86_64)
url='https://github.com/J-Lentz/iwgtk'
license=(GPL3)
depends=(iwd gtk3)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/J-Lentz/iwgtk/archive/v0.2.tar.gz")
sha256sums=(c1a26589c31cafc79794a9b1d9c82cbcaa4eff221a0743238e9541bdf20c2eef)

build() {
    cd ${pkgname}-${pkgver}
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make prefix=/usr DESTDIR=${pkgdir} install
}
