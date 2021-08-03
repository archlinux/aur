# Maintainer: Duy Nguyen <contact@duy-nguyen.com)

pkgname=brother-mfcl2700dw-lpr-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="LPR driver for Brother MFC-L2700DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=mfcl2700dw_us_eu_as"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf101791/mfcl2700dwlpr-3.2.0-1.i386.deb")
md5sums=("6b163fe09d2ee1cb38359ee1e1a7f051")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
