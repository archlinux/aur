# Maintainer: Fazzi <faarisansari@googlemail.com>

pkgname=nvidia-modprobe-service
pkgver=1
pkgrel=5
pkgdesc="Fixes /oldroot unmount issues by unloading nvidia modules before shutdown / reboot."
arch=('any')
license=('GPL')
depends=('systemd')
install="notes.install"
url="https://github.com/Fxzzi/nvidia-modprobe-service"

source=('nvidia-modprobe.service'
	'notes.install')

sha256sums=('db66b0fc66d1ca68e7cc0f64e203e1bf7b5b612899fd58a5a0e18b8f7ec4d30d'
	    'aa5902887da3a6f79ab2d9fbd3c64d7b861b213902b05b4f30c314425636c1fb')


package() {
	install -Dm 644 nvidia-modprobe.service -t "$pkgdir"/usr/lib/systemd/system/
}
