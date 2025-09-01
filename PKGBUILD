# Maintainer: Jacob Meyers <jeyersdev@gmail.com>
pkgname=alescript
pkgver=1.0
pkgrel=2
pkgdesc="A programming language targeted for building console applications."
arch=('x86_64')
url="https://jd.pnc3.net/software/alescript"
license=('Apache-2.0')
depends=()
makedepends=('cmake' 'gcc' 'make')
source=("https://github.com/Jeyers-Development/aleScript-main/releases/download/$pkgver/alescript.tar.gz")
sha256sums=('7182db862228818b65f908fad88da3c79089956095599affeae66496d899b30b')

package() {
    install -Dm755 "$srcdir/alescript" "$pkgdir/usr/bin/alescript"
}
