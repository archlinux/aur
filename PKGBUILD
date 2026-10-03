# Maintainer: Dresden Wildey <dresden196@gmail.com>
# Transitional package: Fubuki is now Stoke. Install stoke-gtk.
pkgname=fubuki-gtk
pkgver=0.3.0
pkgrel=1
pkgdesc="Bootable USB writer, formerly Fubuki (transitional, install stoke-gtk)"
arch=('any')
url="https://github.com/dresden196/stoke"
license=('GPL-3.0-or-later')
depends=('stoke-gtk')

package() {
    install -d "$pkgdir/usr/share/doc/fubuki-gtk"
    echo "fubuki-gtk is now stoke-gtk." > "$pkgdir/usr/share/doc/fubuki-gtk/README"
}
