# Maintainer: Maxwell Pray <synthead@gmail.com>

pkgname=home-assistant-simple-thermostat
pkgver=2.5.0
pkgrel=2
pkgdesc="A different take on the thermostat card for Home Assistant"
arch=(any)
url="https://github.com/nervetattoo/simple-thermostat"
license=(MIT)
source=("https://github.com/nervetattoo/simple-thermostat/releases/download/v$pkgver/simple-thermostat.js")
sha256sums=("982effe8cb15acb90d82496ce950c06828074f3c399e8615f9539e0b2eb2f97a")

package() {
  install -Dm 644 "$srcdir/simple-thermostat.js" "$pkgdir/var/lib/private/hass/www/simple-thermostat.js"
}
