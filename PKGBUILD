# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=tuxedo-plymouth-one
pkgver=1.0.1.4
pkgrel=1
pkgdesc="TUXEDO style plymouth theme"
arch=('any')
url="https://github.com/tuxedocomputers/tuxedo-plymouth-one"
license=('GPLv2')
depends=('plymouth')
source=(git+https://github.com/tuxedocomputers/tuxedo-plymouth-one)
install="${pkgname}.install"
sha256sums=('SKIP')
sha512sums=('SKIP')
package() {
    cd $srcdir/tuxedo-plymouth-one
    mkdir -p $pkgdir/usr/share/plymouth/themes/tuxedo-one
    install -Dm644 * $pkgdir/usr/share/plymouth/themes/tuxedo-one
}
