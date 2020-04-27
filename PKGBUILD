# Maintainer: Paul Kramer <gitterrost4@gmail.com>

pkgname=brother-dcp7055w-lpr-bin
pkgver=3.0.1
pkgrel=1
pkgdesc="LPR driver for Brother DCP-7055W printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=gb&lang=en&prod=dcp7055w_us_eu_as"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf005531/dcp7055wlpr-3.0.1-1.i386.deb")
md5sums=("eca6a2a8f1743c9734cad84fe8e31756")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
