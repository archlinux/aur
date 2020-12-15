# Maintainer: Tim Cassels <cassels2025@gmail.com>

pkgname=brother-dcp385c-lpr-bin
pkgver=1.1.2
pkgrel=2
pkgdesc="LPR driver for Brother DCP-385C printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=dcp385c_all"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf005395/dcp385clpr-1.1.2-2.i386.deb")
md5sums=("f1b6caa3a4726fd60eb85ea54313c324")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
	chown -R cups:cups "${pkgdir}/usr/local/Brother/Printer/dcp385c/inf"
}
