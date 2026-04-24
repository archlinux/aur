# Maintainer: phluxjr <phluxjr@phluxjr.net>
pkgname=confy-tui
pkgver=2.1.2
pkgrel=1
pkgdesc="a config manager for linux/unix based systems, now with basic windows support!"
arch=('any')
url="https://github.com/Phluxjr23/confy"
license=('GPL-3.0-or-later')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Phluxjr23/confy/archive/v${pkgver}.tar.gz")
sha256sums=('b665d409bede888a6a3d2bebdf8f31015baeb7511fe9054193976f7b15ce29ef')

package() {
    cd "$srcdir/confy-$pkgver"
    install -Dm755 main.py "$pkgdir/usr/bin/confy"
    install -Dm644 confy.1 "$pkgdir/usr/share/man/man1/confy.1"
}
