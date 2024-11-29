pkgname=brother-hll5210dn
pkgver=4.0.3
pkgrel=1
pkgdesc="LPR driver for Brother HL-L5210DN printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=ca&lang=en&prod=hll5210dn_us_eu_as"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf105785/hll5210dnpdrv-${pkgver}-1.i386.deb")
md5sums=('5056bde94950fe154f6f4a3094c5a1df')

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
