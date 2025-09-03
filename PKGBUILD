# Maintainer: Jacob Meyers <jeyersdev@gmail.com>
pkgname=paciam
pkgver=1.1
pkgrel=3
pkgdesc="A lightweight tool to install AUR packages."
arch=('x86_64')
url="https://jd.pnc3.net"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'gcc' 'make')
source=("https://github.com/Jeyers-Development/paciam-source/releases/download/$pkgver/paciam.tar.gz")
sha256sums=('37a12ebb232a15dd7b2aefa46f6a58258a3981ec6b1615919d38129e5e12d936')

package() {
    install -Dm755 "$srcdir/paciam/paciam" "$pkgdir/usr/bin/paciam"
}
