# Maintainer: Fazzi <faarisansari@googlemail.com>

pkgname=nvidia-modprobe-service
pkgver=1
pkgrel=1
pkgdesc="Fixes /oldroot unmount issues by unloading nvidia modules before shutdown / reboot."
arch=('any')
license=('GPL')
depends=('systemd')
install="notes.install"

package() {
	install -Dm644 "nvidia-modprobe.service" "$pkgdir/usr/lib/systemd/system/nvidia-modprobe.service"
}
