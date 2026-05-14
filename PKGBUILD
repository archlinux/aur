# Maintainer: Alva <https://aur.archlinux.org/account/Alva>
pkgname=lntrn
pkgver=1.2
pkgrel=1
pkgdesc="Displays system information alongside an ANSI Lantern"
arch=('any')
url="https://github.com/Jca56/lntrn"
license=('GPL-3.0-only')
depends=('bash' 'python' 'python-pillow')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Jca56/lntrn/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7ac1686aa8bf057d8b922e0432f3af5e0cae95848265696de349c5a6923930db')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 lntrn              "$pkgdir/usr/bin/lntrn"
    install -Dm755 lntrn-sysmon-view  "$pkgdir/usr/share/lntrn/lntrn-sysmon-view"
    install -Dm644 assets/lntrn.png   "$pkgdir/usr/share/lntrn/lntrn.png"
}
