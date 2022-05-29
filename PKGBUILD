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
	    '15d2d58c1ae9055cac4b4930a532e53f59b4a8a214d2c6ac245b3f92a07b21d8')


package() {
	install -Dm 644 nvidia-modprobe.service -t "$pkgdir"/usr/lib/systemd/system/
}
