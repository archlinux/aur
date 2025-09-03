# Maintainer: Jacob Meyers <jeyersdev@gmail.com>
pkgname=paciam
pkgver=1.0
pkgrel=1
pkgdesc="A lightweight tool to install AUR packages."
arch=('x86_64')
url="https://jd.pnc3.net"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'gcc' 'make')
source=("https://github.com/Jeyers-Development/paciam-source/releases/download/$pkgver/paciam.tar.gz")
sha256sums=('9c454766a109fdc1403a424d16ae3cd1f342f5658645e5e827c3df5e792c76bb')

package() {
    install -Dm755 "$srcdir/paciam/paciam" "$pkgdir/usr/bin/paciam"
}
