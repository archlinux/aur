# Maintainer: setrofim  <setrofim@gmail.com>
pkgname=epson-inkjet-printer-workforce-wf7610-series
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="EPSON Workforce WF-7610 Series printer driver"
arch=("x86_64")
url="https://www.openprinting.org/printer/Epson/Epson-WF-7610_Series"
license=('GPL' 'custom:Epson Licence Agreement')
groups=()
depends=('cups' 'epson-inkjet-printer-escpr')
makedepends=('deb2targz')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('http://download.ebz.epson.net/dsc/op/stable/debian/dists/lsb3.2/main/binary-amd64/epson-inkjet-printer-escpr_1.4.1-1lsb3.2_amd64.deb')
noextract=()
md5sums=('dddfdf90ab9322e7316d1ce859b3a26b')
validpgpkeys=()


build() {
	cd "$srcdir"
	deb2targz epson-inkjet-printer-escpr_1.4.1-1lsb3.2_amd64.deb
	tar xf  epson-inkjet-printer-escpr_1.4.1-1lsb3.2_amd64.tar.gz
}


package() {
	cd "$srcdir"
	cp -r opt/ $pkgdir/
}
