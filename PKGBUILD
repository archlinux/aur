# Maintainer: Fazzi <faarisansari@googlemail.com>

pkgname=nvidia-modprobe-service
pkgver=1
pkgrel=8
pkgdesc="Fixes /oldroot unmount issues by unloading nvidia modules before shutdown / reboot."
arch=('any')
license=('GPL')
depends=('systemd')
install="notes.install"
url="https://github.com/Fxzzi/nvidia-modprobe-service"

source=('nvidia-modprobe.service'
	'notes.install')

sha256sums=('1448af15034cf5bcd4e9a44d757833b5f07bcf3a6217ea621f6d42d0806ee832'
	    'c105f4a328491f31984d767bc15042122d4de59cca4c3d46fbd7712004053982')


package() {
	install -Dm 644 nvidia-modprobe.service -t "$pkgdir"/usr/lib/systemd/system/
}
