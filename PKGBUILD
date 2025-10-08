# Maintainer: Johan Skajaa

pkgname=test_echo_pgk
pkgver=1.0
pkgrel=1
pkgdesc="Test echo package"
arch=('any')
license=('MIT')
depends=('bash')
source=('test_echo_pgk')
sha256sums=('SKIP')  # okay for simple test scripts

package() {
    install -Dm755 "$srcdir/test_echo_pgk" "$pkgdir/usr/bin/test_echo_pgk"
}
