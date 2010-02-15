# Contributor: Vain

pkgname=iscan-plugin-gt-s600
pkgver=2.1.0_3.c2
pkgrel=1
pkgdesc="iscan plugin for Epson Perfection V10."
arch=('i686')
url="http://www.avasys.jp/lx-bin2/linux_e/spc/DL2.do"
license=('GPL' 'LGPL' 'EAPL')
depends=('iscan')
makedepends=('rpmextract')
source=(http://linux.avasys.jp/drivers/scanner-plugins/GT-S600/$pkgname-${pkgver//_/-}.i386.rpm)
md5sums=('62e48226b0cf2661f3cb3f59a6a6a50e')
install=gt-s600.install

build() {
	cd "$startdir"
	rpmextract.sh "$pkgname-${pkgver//_/-}.i386.rpm"
	mv usr "$pkgdir"
}
