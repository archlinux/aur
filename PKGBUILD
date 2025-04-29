# Maintainer: Rohan Ferris <zjrohan@gmail.com>

pkgname=home-assistant-clock-weather-card
pkgver=2.8.11
pkgrel=1
pkgdesc="A home-assistant card to show date, time and weather."
arch=(any)
url="https://github.com/pkissling/clock-weather-card"
license=(MIT)
source=("https://github.com/pkissling/clock-weather-card/releases/download/v${pkgver}/clock-weather-card.js")
sha256sums=('4a206567b7bb39698972572a877233c9ae1f7f2cfeb20f033f94fc5ca8c65b3b')

package() {
  install -Dm 644 "$srcdir/clock-weather-card.js" "$pkgdir/var/lib/private/hass/www/clock-weather-card.js"
}

