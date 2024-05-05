# Maintainer: Daniele Moser <dnlmsr0@gmail.com>
pkgname=brother-mfc-l2827dw-lpr-bin
pkgver=4.1.0
pkgrel=2
pkgdesc="LPR driver for Brother MFC-L2827DW(XL) printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/downloadlist.aspx?c=it&lang=it&prod=mfcl2827dw_eu&os=128&flang=English"
license=("EULA")
source=("http://www.brother.com/pub/bsc/linux/packages/mfcl2827dwpdrv-${pkgver}-1.i386.deb")
depends=("lib32-glibc")
md5sums=("6a6e0a91a7276037e60ba7e8392d5190")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
