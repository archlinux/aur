# Maintainer: markustieger <markustieger@gmail.com>

pkgname=homeassistant-printerqueue
pkgver=1.1
pkgrel=1
pkgdesc="Turns on the printer if something is in its queue"
arch=('any')
depends=('systemd' 'python-homeassistant-cli' 'bash' 'cups')
license=('GPL')
url="https://aur.archlinux.org/packages/homeassistant-printerqueue"

package() {
  install -Dm644 "../homeassistant-printerqueue@.service" "${pkgdir}/usr/lib/systemd/system/homeassistant-printerqueue@.service"
  install -Dm744 "../homeassistant-printerqueue.sh" "${pkgdir}/usr/lib/systemd/system/homeassistant-printerqueue.sh"
}
