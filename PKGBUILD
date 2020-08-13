# Maintainer: Jesse Lentz <jesselnz@gmail.com>

pkgname=iwgtk
pkgver=0.1
pkgrel=1
pkgdesc='Lightweight, graphical wifi management utility'
arch=(x86_64)
url='https://github.com/J-Lentz/iwgtk'
license=(GPL3)
depends=(iwd gtk3)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/J-Lentz/iwgtk/archive/v0.1.tar.gz")
sha256sums=(298516f028c1d337bd851129532bd1cce900cdfce8aefe5ea2b63c44032eb799)

build() {
    cd ${pkgname}-${pkgver}
    make
}

package() {
    cd ${pkgname}-${pkgver}
    install -d ${pkgdir}/usr/bin
    install iwgtk ${pkgdir}/usr/bin
}
