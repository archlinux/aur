# Maintainer: Frank Baumgartner <fb@b-nm.at>

pkgname=brother-hll9200cdw-lpr-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="LPR driver for Brother HL-L9200CDW(T) printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=ca&lang=en&prod=hll9200cdw_us_as_cn"
license=("EULA")
groups=("base-devel")
source=("http://www.brother.com/pub/bsc/linux/packages/hll9200cdwlpr-1.1.2-1.i386.deb")
md5sums=("30124df7d49362906a2a118eff3c710e")

package() {
	tar -xf data.tar.gz -C "${pkgdir}"
}
