# Maintainer: markustieger <markustieger@gmail.com>

pkgname=homeassistant-scanner
pkgver=1.3
pkgrel=1
pkgdesc="Turns on the printer if a specified scanner application is open"
arch=('any')
depends=('systemd' 'python-homeassistant-cli' 'bash' 'procps-ng')
license=('GPL')
url="https://aur.archlinux.org/packages/homeassistant-scanner"

package() {
  install -Dm644 "../homeassistant-scanner@.service" "${pkgdir}/usr/lib/systemd/system/homeassistant-scanner@.service"
  install -Dm744 "../homeassistant-scanner.sh" "${pkgdir}/usr/lib/systemd/system/homeassistant-scanner.sh"
}
