# Maintainer: Fazzi <faarisansari@googlemail.com>

pkgname=nvidia-modprobe-service
pkgver=1
pkgrel=9
pkgdesc="Fixes /oldroot unmount issues by unloading nvidia modules before shutdown / reboot."
arch=('any')
license=('GPL')
depends=('systemd')
install="notes.install"
url="https://github.com/Fxzzi/nvidia-modprobe-service"

source=('nvidia-modprobe.service'
	'notes.install')

sha256sums=('7986dbe15228e4a04ac60bbfe7efadce0407395b50a28056acfede9317cbc04d'
	    'c105f4a328491f31984d767bc15042122d4de59cca4c3d46fbd7712004053982')


package() {
	install -Dm 644 nvidia-modprobe.service -t "$pkgdir"/usr/lib/systemd/system/
}
