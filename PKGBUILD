# Maintainer: Phluxjr23 will@ewnix.net
pkgname=confy-tui
pkgver=2.0.0
pkgrel=1
pkgdesc="a config manager for linux/unix based systems, now with basic windows support!"
arch=('any')
url="https://github.com/Phluxjr23/confy"
license=('MIT')
depends=('python' 'ranger')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Phluxjr23/confy/archive/v${pkgver}.tar.gz")
sha256sums=('36e2debb1065969e172fe8a5be7df94f271ba7bc8c0d7d91dd1af324e2b53a19')

package() {
    cd "$srcdir/confy-$pkgver"
    install -Dm755 main.py "$pkgdir/usr/bin/confy"
}
