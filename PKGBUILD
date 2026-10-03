# Maintainer: Dresden Wildey <dresden196@gmail.com>
# Transitional package: Fubuki is now Stoke. Install stoke.
pkgname=fubuki
pkgver=0.3.0
pkgrel=1
pkgdesc="Bootable USB writer, formerly Fubuki (transitional, install stoke)"
arch=('any')
url="https://github.com/dresden196/stoke"
license=('GPL-3.0-or-later')
depends=('stoke')

package() {
    install -d "$pkgdir/usr/share/doc/fubuki"
    echo "fubuki is now stoke." > "$pkgdir/usr/share/doc/fubuki/README"
}
