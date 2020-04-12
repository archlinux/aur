# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=home-assistant-restriction-card
pkgver=1.1.9
pkgrel=1
pkgdesc="A card to provide restrictions on Lovelace cards defined within."
arch=(any)
url="https://github.com/iantrich/restriction-card"
license=(MIT)
source=("https://github.com/iantrich/restriction-card/releases/download/$pkgver/restriction-card.js")
sha256sums=("e924c726fb7cbdf6732bd613939aa2871fc160d1c27271300e432f35f88a2097")

package() {
  install -Dm 644 "$srcdir/restriction-card.js" "$pkgdir/var/lib/hass/www/restriction-card.js"
}
