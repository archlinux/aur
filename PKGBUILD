# Maintainer: Fazzi <faarisansari@googlemail.com>

pkgname=nvidia-modprobe-service
pkgver=2
pkgrel=3
pkgdesc="Fixes /oldroot unmount issues by unloading nvidia modules before shutdown / reboot."
arch=('any')
license=('GPL')
depends=('systemd')
url="https://github.com/Fxzzi/nvidia-modprobe-service"

source=('nvidia.shutdown')

sha256sums=('53ffa6ac9098be4ac212ec6d91289bc44367f311046542528f49ff6895784473')

package() {
	install -Dm 644 nvidia.shutdown -t "$pkgdir"/usr/lib/systemd/system-shutdown/
}
