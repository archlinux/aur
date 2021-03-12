pkgname=xrt-bin
pkgver=2020.2
pkgrel=1
pkgdesc="Xilinx Run Time for FPGA"
arch=('x86_64')
url="https://github.com/Xilinx/XRT"
license=('EULA')
groups=('base-devel')
depends=(ocl-icd)
optdepends=(vivado)
source=(https://www.xilinx.com/bin/public/openDownload?filename=xrt_202020.2.8.743_20.04-amd64-xrt.deb)
md5sums=(4dd5237ab928507ffb7070b3412869a7)

package() {
	tar -zxf data.tar.gz -C "${pkgdir}"
	mv "${pkgdir}/lib" "${pkgdir}/usr/lib"
}
