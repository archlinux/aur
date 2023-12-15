# Maintainer: Daniel Stevenson <dstevensonpc@gmail.com>
pkgname=brother-mfcj4320dw-cups-bin
pkgver=3.0.1
pkgrel=1
pkgdesc="CUPS wrapper for Brother MFC-J4320DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=mfcj4320dw_us"
license=("GPL2")
groups=("base-devel")
source=("http://www.brother.com/pub/bsc/linux/packages/mfcj4320dwcupswrapper-3.0.1-1.i386.deb")
md5sums=('1730bfb9cee6804fe55ebf7e5c1f072e')

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
