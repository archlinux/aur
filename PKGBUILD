pkgname=fpga-manager-script
pkgver=0.0.1
pkgrel=1
pkgdesc="Install user script that loads and unloads overlays using kernel fpga-manager"
arch=(i686 x86_64 arm aarch64)
url=https://github.com/Xilinx/meta-xilinx
license=(custom)

source=("https://raw.githubusercontent.com/Xilinx/meta-xilinx/refs/heads/master/meta-xilinx-core/recipes-bsp/fpga-manager-script/files/fpgautil.c")
sha256sums=('e917ebf8aaf2e18500405750af9ca04d75eb7c5d47166879f3a56b967fa2b78a')

build() {
	cc fpgautil.c -o fpgautil
}

package() {
	install -D fpgautil -t "$pkgdir/usr/bin"
}
# ex: nowrap
