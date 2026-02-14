# Maintainer: Javier Poremski <javier@poremski.se>
# Contributor: Thilo-Alexander Ginkel <thilo@ginkel.com>

pkgname=kbd-us-intl-nodeadkeys
pkgver=1.0
pkgrel=1
pkgdesc="US international keymap for Linux virtual console with AltGr accents."
arch=('any')
license=('Apache-2.0')
source=("us-altgr-intl-nodeadkeys.map")
sha256sums=('bedb5df228ccd58de7df69c2fe5293ef55fe3fe4d5d13fc75d8e8b5ff5329fe3')
depends=('kbd')
url="https://github.com/Poremski/us-intl-altgr"
source=("${url}/raw/refs/tags/v${pkgver}-${pkgrel}/us-altgr-intl-nodeadkeys.map")

package() {
  gzip -f us-altgr-intl-nodeadkeys.map
  install -Dm644 us-altgr-intl-nodeadkeys.map.gz \
    "$pkgdir/usr/share/kbd/keymaps/i386/qwerty/us-altgr-intl-nodeadkeys.map.gz"
}
