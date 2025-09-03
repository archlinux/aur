# Maintainer: Jacob Meyers <jeyersdev@gmail.com>
pkgname=paciam
pkgver=1.0
pkgrel=2
pkgdesc="A lightweight tool to install AUR packages."
arch=('x86_64')
url="https://jd.pnc3.net"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'gcc' 'make')
source=("https://github.com/Jeyers-Development/paciam-source/releases/download/$pkgver/paciam.tar.gz")
sha256sums=('cd3e1364a9e4039d494e551a74535a8756a5625e16a569ed93040d47cb11c0ba')

package() {
    install -Dm755 "$srcdir/paciam/paciam" "$pkgdir/usr/bin/paciam"
}
