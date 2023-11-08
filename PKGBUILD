# Maintainer: Liao Junxuan <mikeljx@126.com>
pkgname=systemd-bt-sleep
pkgver=0.1.0
pkgrel=2
pkgdesc="A systemd service for disabling Bluetooth during sleep, suspend, etc."
arch=('any')
url=""
license=('GPL-3-or-later')
depends=(bluez)
source=("bt-sleep.service")
sha256sums=('22a4b99bbe1254f2c828543533a9241e05cc327555c2361fdf29e4b1e7cb51c5')

package() {
	install -D -m644 \
        ./*.service -t "$pkgdir"/usr/lib/systemd/system/
}
