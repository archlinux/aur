# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=cpqacuxe
pkgver=8.70_9.0.7_8
pkgrel=1
pkgdesc="HP Array Configuration Utility"
arch=(i686 x86_64)
url="http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack"
depends=(bash hpsmh)
groups=(hpproliant)
license=("CUSTOM")

[ $CARCH = "x86_64" ] && depends=(${depends[@]} lib32-gcc-libs)

source=(http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack/pool/non-free/${pkgname}_${pkgver//_/-}_i386.deb)

package() {
	cd "$pkgdir"
	tar xf "$srcdir/data.tar.gz"
}

sha256sums=('be727f086d628922e39955a2e200a2bbf544c7884c6153a027fdb28f765235bb')

