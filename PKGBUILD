# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=lxroot
pkgver=0.22.1
pkgrel=1
pkgdesc='A lightweight, flexible, and safer alternative to chroot and/or Docker.'
arch=('x86_64')
url='https://github.com/parke/lxroot'
license=('GPL3')
source=("https://github.com/parke/lxroot/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4eb7607b653bf952612f82ec994123598be0596db2e9fdb28d93ab978117327e')

build() {
    cd $pkgname-$pkgver
    make build
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 bin/lxroot "$pkgdir/usr/bin/lxroot"
}
