# Maintainer: Ben Green <ben@greendalba.com>

pkgname=brother-mfc8860dn-lpr-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="LPR driver for Brother MFC-8860DN printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=ca&lang=en&prod=mfc8860dn_all"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf006397/brmfc8860dnlpr-2.0.1-1.i386.deb")
md5sums=("c048532f2ef8ce9fc9e32eacb56d9b1d")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
