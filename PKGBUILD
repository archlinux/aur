# Maintainer: Jacob Meyers <jeyersdev@gmail.com>
pkgname=paciam
pkgver=1.1
pkgrel=1
pkgdesc="A lightweight tool to install AUR packages."
arch=('x86_64')
url="https://jd.pnc3.net"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'gcc' 'make')
source=("https://github.com/Jeyers-Development/paciam-source/releases/download/$pkgver/paciam.tar.gz")
sha256sums=('bd3a551f74f8964422e1393fe9ce5b6b756fcbc9f1ce62a6fc63f4b423386a7e')

package() {
    install -Dm755 "$srcdir/paciam/paciam" "$pkgdir/usr/bin/paciam"
}
