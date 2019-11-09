# Maintainer: Zak Zajac <zak@madzak.com>

pkgname=brother-hl3170cdw-lpr-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="LPR driver for Brother HL-3170CDW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=hl3170cdw_all"
license=("EULA")
groups=("base-devel")
source=("https://support.brother.com/g/b/files/dlf/dlf007056/hl3170cdwlpr-1.1.2-1.i386.deb")
md5sums=("aba0d86cabac559db68d110de7717aac")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
