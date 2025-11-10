# Maintainer: Phluxjr23 will@ewnix.net
pkgname=confy-tui
pkgver=1.0.0
pkgrel=1
pkgdesc="a config manager for linux/unix based systems"
arch=('any')
url="https://github.com/Phluxjr23/confy"
license=('MIT')
depends=('python' 'ranger')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Phluxjr23/confy/archive/v${pkgver}.tar.gz")
sha256sums=('aba14b260d0f454c8c05c38e0740c85f4abafb3d73b7caa7f504a3de02164fbb')

package() {
    cd "$srcdir/confy-$pkgver"
    install -Dm755 main.py "$pkgdir/usr/bin/confy"
}
