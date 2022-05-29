# Maintainer: Fazzi <faarisansari@googlemail.com>

pkgname=nvidia-modprobe-service
pkgver=1
pkgrel=7
pkgdesc="Fixes /oldroot unmount issues by unloading nvidia modules before shutdown / reboot."
arch=('any')
license=('GPL')
depends=('systemd')
install="notes.install"
url="https://github.com/Fxzzi/nvidia-modprobe-service"

source=('nvidia-modprobe.service'
	'notes.install')

sha256sums=('54f16d315c1f0c4e8fc6ca465a8982ace1029b2fd42ed6e77304584109bf5e0d'
	    '15d2d58c1ae9055cac4b4930a532e53f59b4a8a214d2c6ac245b3f92a07b21d8')


package() {
	install -Dm 644 nvidia-modprobe.service -t "$pkgdir"/usr/lib/systemd/system/
}
