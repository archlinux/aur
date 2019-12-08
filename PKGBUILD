# Maintainer: Evan Goode <mail@evangoo.de>

pkgname=brother-hll3270cdw-lpr-bin
pkgver=1.0.2
pkgrel=1
pkgdesc="LPR driver for Brother HL-L3270CDW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=hll3270cdw_us_eu_as"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf103926/hll3270cdwpdrv-1.0.2-0.i386.deb")
md5sums=("c5a011c34dcfe55d43585bcac9e852bb")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
