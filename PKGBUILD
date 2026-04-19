# Maintainer: phaleth
pkgname=brother-dcp1622we-lpr-bin
pkgver=3.0.1
pkgrel=1
pkgdesc="LPR driver for Brother DCP-1622WE printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=eu_ot&lang=en&prod=dcp1622we_eu"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf102485/dcp1610wlpr-${pkgver}-${pkgrel}.i386.deb")
sha256sums=('862d1bdb70e0497553fdf340f98d9a24e768a6ded2c235326327aff356e81a58')
package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
