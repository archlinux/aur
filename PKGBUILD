# Maintainer: Duy Nguyen <contact@duy-nguyen.com)

pkgname=brother-mfcl2700dw-cups-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="CUPS driver for Brother MFC-L2700DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=mfcl2700dw_us_eu_as"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf101792/mfcl2700dwcupswrapper-3.2.0-1.i386.deb")
md5sums=("9a2acb8a5401f785d2a9cb1d7c2944fa")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
