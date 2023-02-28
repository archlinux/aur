# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=home-assistant-restriction-card
pkgver=1.2.7
pkgrel=2
pkgdesc="A card to provide restrictions on Lovelace cards defined within."
arch=(any)
url="https://github.com/iantrich/restriction-card"
license=(MIT)
source=("https://github.com/iantrich/restriction-card/releases/download/$pkgver/restriction-card.js")
sha256sums=("a134c8d1c05e02f93a5d634fa404d21ab6545dfefc37dc730e6b784447a3f4a1")

package() {
  install -Dm 644 "$srcdir/restriction-card.js" "$pkgdir/var/lib/private/hass/www/restriction-card.js"
}
