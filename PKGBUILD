# Maintainer: Ivan Naydonov <samogot@gmail.com>

pkgname=ricoh-spc261-ppd
pkgver=1.0.1
pkgrel=1
pkgdesc="CUPS driver for Ricoh SP C 261DNw series"
arch=("x86_64")
url="http://support.ricoh.com/bb/html/dr_ut_e/re1/model/spc261dnw/spc261dnw.htm"
license=("unknown")
depends=("cups" )
makedepends=("binutils" "p7zip")

source=("http://support.ricoh.com/bb/pub_e/dr_ut_e/0001305/0001305295/V101/r80978en.exe")
sha256sums=("a91017ab0ce697dff16d4a0f699c4525f87acc25b5ed673f8563f165c1416de6")

prepare() {
	ar x sp260-series-p-pcl-1.01-noarch.deb
	tar -zxf data.tar.gz
}

package() {
	install -d $pkgdir/usr
	cp -a usr $pkgdir
}
