# Maintainer: Jacob Meyers <jeyersdev@gmail.com>
pkgname=paciam
pkgver=1.2
pkgrel=1
pkgdesc="A lightweight tool to install AUR packages."
arch=('x86_64')
url="https://jd.pnc3.net"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'gcc' 'make')
source=("https://github.com/Jeyers-Development/paciam-source/releases/download/$pkgver/paciam.tar.gz")
sha256sums=('43d31d24effce7d6bcac20e079cefd32dd7a7d6025a7cd31686c6098169ff625')

package() {
    install -Dm755 "$srcdir/paciam/paciam" "$pkgdir/usr/bin/paciam"
}
