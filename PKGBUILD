# Maintainer: Rohan Ferris <zjrohan@gmail.com>

pkgname=home-assistant-clock-weather-card
pkgver=2.8.5
pkgrel=1
pkgdesc="A home-assistant card to show date, time and weather."
arch=(any)
url="https://github.com/pkissling/clock-weather-card"
license=(MIT)
source=("https://github.com/pkissling/clock-weather-card/releases/download/v${pkgver}/clock-weather-card.js")
sha256sums=('1bd285f5bf8a7e11df9c4d3383e2912b216b6b299de09b9eb741a0804073ddec')

package() {
  install -Dm 644 "$srcdir/clock-weather-card.js" "$pkgdir/var/lib/private/hass/www/clock-weather-card.js"
}

