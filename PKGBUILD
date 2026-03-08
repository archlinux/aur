# Maintainer: Alva <https://aur.archlinux.org/account/Alva>
pkgname=lntrn
pkgver=1.1
pkgrel=1
pkgdesc="Displays system information alongside an ANSI Lantern"
arch=('any')
url="https://github.com/Jca56/lntrn"
license=('GPL-3.0-only')
depends=('bash' 'python' 'python-pillow')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Jca56/lntrn/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1b69447b709080aa265c6c237b86fc2adac8680224fc67d1083c231f2dd46973')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 lntrn            "$pkgdir/usr/bin/lntrn"
    install -Dm644 assets/lntrn.png "$pkgdir/usr/share/lntrn/lntrn.png"
}
