# Maintainer: Dresden Wildey <dresden196@gmail.com>
# Transitional package: Fubuki is now Stoke. Install stoke-qt.
pkgname=fubuki-ui
pkgver=0.3.0
pkgrel=1
pkgdesc="Bootable USB writer, formerly Fubuki (transitional, install stoke-qt)"
arch=('any')
url="https://github.com/dresden196/stoke"
license=('GPL-3.0-or-later')
depends=('stoke-qt')

package() {
    install -d "$pkgdir/usr/share/doc/fubuki-ui"
    echo "fubuki-ui is now stoke-qt." > "$pkgdir/usr/share/doc/fubuki-ui/README"
}
