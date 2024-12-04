# Maintainer: Rohan Ferris <zjrohan@gmail.com>

pkgname=home-assistant-clock-weather-card
pkgver=2.8.6
pkgrel=1
pkgdesc="A home-assistant card to show date, time and weather."
arch=(any)
url="https://github.com/pkissling/clock-weather-card"
license=(MIT)
source=("https://github.com/pkissling/clock-weather-card/releases/download/v${pkgver}/clock-weather-card.js")
sha256sums=('65fb2c9ced2f7dd5c34c32e3cd094a686c5ac9384d8892ff49d1b1266b9815d6')

package() {
  install -Dm 644 "$srcdir/clock-weather-card.js" "$pkgdir/var/lib/private/hass/www/clock-weather-card.js"
}

