# Maintainer: Ludovic Fauvet <etix at l0cal dot com>

pkgname=wowlan-systemd
pkgver=20190906
pkgrel=1
pkgdesc="A systemd unit file for enabling Wake-On-WLAN automatically"
arch=('any')
license=('MIT')
depends=('iw')
install=wowlan-systemd.install
source=('wowlan@.service' 'wowlan-systemd.install')

package() {
  install -Dm 644 wowlan@.service "${pkgdir}/usr/lib/systemd/system/wowlan@.service"
}
sha256sums=('84be5eeb4aa70ff97146c0f628984d2799564d5e813c86219798cc8633c746f4'
            'c1e5fd009b8905adfeda674e25c34379048e2e968bedcc5be7537a45950d89da')
