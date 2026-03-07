# Maintainer: phluxjr <phluxjr@phluxjr.net>
pkgname=confy-tui
pkgver=2.1.0
pkgrel=1
pkgdesc="a config manager for linux/unix based systems, now with basic windows support!"
arch=('any')
url="https://gitlab.com/phluxjr/confy"
license=('GPL-3.0-or-later')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Phluxjr23/confy/archive/v${pkgver}.tar.gz")
sha256sums=('71e6a4b2ab191934430ab8781229fbe36f436d4cb7e439fb728e2f8fd4360bac')

package() {
    cd "$srcdir/confy-$pkgver"
    install -Dm755 main.py "$pkgdir/usr/bin/confy"
    install -Dm644 confy.1 "$pkgdir/usr/share/man/man1/confy.1"
}
