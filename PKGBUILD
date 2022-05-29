# Maintainer: Fazzi <faarisansari@googlemail.com>

pkgname=nvidia-modprobe-service
pkgver=2
pkgrel=1
pkgdesc="Fixes /oldroot unmount issues by unloading nvidia modules before shutdown / reboot."
arch=('any')
license=('GPL')
depends=('systemd')
install="notes.install"
url="https://github.com/Fxzzi/nvidia-modprobe-service"

source=('nvidia.shutdown'
	'notes.install')

sha256sums=('70887ad4e0a2759aeb929514287e83c5b01016bfb8e19098b42d7fb11dcd5af6'
	    'c105f4a328491f31984d767bc15042122d4de59cca4c3d46fbd7712004053982')


package() {
	install -Dm 644 nvidia.shutdown -t "$pkgdir"/usr/lib/systemd/system-shutdown/
}
