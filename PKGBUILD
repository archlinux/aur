# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=home-assistant-simple-thermostat
pkgver=0.34.1
pkgrel=1
pkgdesc="A different take on the thermostat card for Home Assistant"
arch=(any)
url="https://github.com/nervetattoo/simple-thermostat"
license=(MIT)
source=("https://github.com/nervetattoo/simple-thermostat/releases/download/$pkgver/simple-thermostat.js")
sha256sums=("0d7e038233ee7fada751120486bfe9b3d8af2f5ed96ecf46272cf2272624e7f2")

package() {
  install -Dm 644 "$srcdir/simple-thermostat.js" "$pkgdir/var/lib/hass/www/simple-thermostat.js"
}
