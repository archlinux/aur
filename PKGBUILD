# Maintainer: Alva <https://aur.archlinux.org/account/Alva>
pkgname=lntrn
pkgver=1.0
pkgrel=1
pkgdesc="Displays system information alongside an ANSI Lantern"
arch=('any')
url="https://github.com/Jca56/lntrn"
license=('GPL-3.0-only')
depends=('bash' 'python' 'python-pillow')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Jca56/lntrn/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('27d95e1ed843c284bbc97479ffe8833cc5fb17e1a406f00557fecef071e68c0d')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 lntrn            "$pkgdir/usr/bin/lntrn"
    install -Dm644 assets/lntrn.png "$pkgdir/usr/share/lntrn/lntrn.png"
}
