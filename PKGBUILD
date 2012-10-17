# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=cpqacuxe
pkgver=9.10_22.0
pkgrel=1
pkgdesc="HP Array Configuration Utility"
arch=(i686 x86_64)
url="http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack"
depends=(bash hpsmh)
groups=(hpproliant)
license=("CUSTOM")

[ $CARCH = "x86_64" ] && depends=(${depends[@]} lib32-gcc-libs)

source=(http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack/RedHatEnterpriseServer/6.2/packages/i386/${pkgname}-${pkgver//_/-}.i386.rpm)

package() {
	cp -a "$srcdir/"{opt,usr} "$pkgdir"
}

sha256sums=('c0d1f3213e33710692361f290eb5b43ebb65a178d99ca1736e8d3a67aa4df8fb')

