# Maintainer: Altoine Barker <chicagominted@gmal.com>
# Contributor: ewanduck <ewan@patchoulihq.cc>
# Contributor: Tim Cassels <cassels2025@gmail.com>

pkgname=brother-hll8360cdw-lpr-bin
pkgver=1.5.0
pkgrel=3
pkgdesc="LPR driver for Brother HL-L8360CDW printer"
arch=("i686" "x86_64")
url="http://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=hll8360cdw_us_eu_as"
license=("EULA")
groups=("base-devel")
source=("http://download.brother.com/welcome/dlf103237/hll8360cdwlpr-1.5.0-3.i386.deb")
md5sums=('33dad0f92ff5854a772809a2be62fe89')

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
