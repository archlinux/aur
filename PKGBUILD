# Maintainer: Justin Dray <justin@dray.be>
pkgname=lsiutil
pkgver=1.63
pkgrel=2
pkgdesc="Configuration utility for LSI MPT adapters (FC, SCSI, and SAS/SATA)"
url="http://http://karlsbakk.net/LSIUtil%20Kit%201.63/Source/"
arch=('x86_64' 'i686')
license=('none')
depends=(glibc)
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://copy.com/D1X42Cf78kCl/public/packages/lsiutil-${pkgver}.tar.gz") 
#Mirror: source=("http://karlsbakk.net/LSIUtil%20Kit%20${pkgver}/Source/lsiutil.tar.gz")
md5sums=('9d62c819ee8d70db43ec651680cb5233')

build() {
	cd "${srcdir}/${pkgname}"
	gcc -Wall -O lsiutil.c -o lsiutil
}

package() {
	cd "${srcdir}/${pkgname}"
	install -Dm755 lsiutil $pkgdir/usr/bin/lsiutil
}

