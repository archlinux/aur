# Maintainer: Taehong Jeong <taehongjeong@naver.com>

pkgname=brother-mfc-t910dw
pkgver=1.0.0
pkgrel=0
pkgdesc="LPR driver for Brother MFC-T910DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=kr&lang=ko&prod=mfct910dw_all"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf103626/mfct910dwpdrv-1.0.0-0.i386.deb")
md5sums=("8b2942a189caaae4fd7e1a6c8b223363")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
