# Maintainer: Dresden Wildey <dresden196@gmail.com>
# Transitional package: the KDE window is now fubuki-qt.
pkgname=fubuki-ui
pkgver=0.2.3
pkgrel=1
pkgdesc="Bootable USB writer in the spirit of Rufus: the KDE window (transitional, install fubuki-qt)"
arch=('any')
url="https://github.com/dresden196/fubuki"
license=('GPL-3.0-or-later')
depends=('fubuki-qt')

package() {
    install -d "$pkgdir/usr/share/doc/fubuki-ui"
    echo "fubuki-ui is now fubuki-qt." > "$pkgdir/usr/share/doc/fubuki-ui/README"
}
