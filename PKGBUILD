# Maintainer: pisevren <aur@local>

pkgname=librevna-udev
pkgver=1.6.5
pkgrel=2
pkgdesc="udev rules for LibreVNA device access"
arch=('any')
url="https://github.com/jankae/LibreVNA"
license=('GPL-3.0-only')
install="${pkgname}.install"

source=("https://raw.githubusercontent.com/jankae/LibreVNA/v${pkgver}/Software/PC_Application/51-vna.rules")
sha256sums=('a37bf60fa15f700152df2969a8af598de82f9ffc51aa6173bd31adac246c70be')

package() {
  install -Dm644 \
    "$srcdir/51-vna.rules" \
    "$pkgdir/etc/udev/rules.d/51-vna.rules"
}
