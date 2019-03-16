# Maintainer: Daniel Aschwanden <nimdanitro@gmail.com

pkgname=brother-hl5350dn-lpr-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="LPR driver for Brother HL-5350DN printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=hl5350dn_eu"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf006004/hl5350dnlpr-2.0.3-1.i386.deb")
md5sums=("6b949b14fdfe35aca66f8fe0a9cec2ad")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
