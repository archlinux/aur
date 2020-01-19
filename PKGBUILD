# Maintainer: Jesse Chahal <jesse@jessechahal.com>

pkgname=brother-mfc7440n-lpr-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="LPR driver for Brother MFC-7440N printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=mfc7440n_all"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf006249/brmfc7440nlpr-2.0.2-1.i386.deb")
md5sums=("881d0c98334f827abd0f2bda63d86cb9")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
