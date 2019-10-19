# Maintainer: Jake Kiermasz <jfkiermasz@googlemail.com>

pkgname=brother-dcp-l2510d
pkgver=4.0.0
pkgrel=1
pkgdesc="CUPS and LPR driver for the Brother L2510D printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=dcpl2510d_eu"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf103516/dcpl2510dpdrv-4.0.0-1.i386.deb")
md5sums=("55b62e08fd9b8900ed2773755b24c3c2")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
