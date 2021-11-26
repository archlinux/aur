pkgname=xrt-bin
pkgver=2021.2
pkgrel=1
pkgdesc="Xilinx Run Time for FPGA"
arch=('x86_64')
url="https://github.com/Xilinx/XRT"
license=('EULA')
groups=('base-devel')
depends=(ocl-icd)
optdepends=(vivado)
source=(https://www.xilinx.com/bin/public/openDownload?filename=xrt_202110.2.11.634_20.04-amd64-xrt.deb)
md5sums=(a40f8a4386e8f92f9af43d1bfae54b62)

package() {
	tar -zxf data.tar.gz -C "${pkgdir}"
	mv "${pkgdir}/lib" "${pkgdir}/usr/lib"
	mv "${pkgdir}/opt/xilinx" "${pkgdir}/opt/Xilinx"
}
