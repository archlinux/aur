# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=lxroot
pkgver=0.22.0
pkgrel=1
pkgdesc='A lightweight, flexible, and safer alternative to chroot and/or Docker.'
arch=('x86_64')
url='https://github.com/parke/lxroot'
license=('GPL3')
source=("https://github.com/parke/lxroot/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5b3f9e310acaded18f3374b0558e83dfca4337c17b8ba5bd47e867196be72a9c')

build() {
    cd $pkgname-$pkgver
    make build
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 bin/lxroot "$pkgdir/usr/bin/lxroot"
}
