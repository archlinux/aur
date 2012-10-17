# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hpacucli
pkgver=9.10_22.0
pkgrel=1
pkgdesc="HP Command Line Array Configuration Utility"
arch=(i686 x86_64)
url="http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack"
depends=(bash)
groups=(hpproliant)
license=("CUSTOM")

[ $CARCH = "x86_64" ] && depends=(${depends[@]} lib32-gcc-libs)

source=(http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack/RedHatEnterpriseServer/6.2/packages/i386/${pkgname}-${pkgver//_/-}.i386.rpm)

package() {
	cp -a "$srcdir/"{opt,usr} "$pkgdir"
}

sha256sums=('e398d184932f8a99c0e3edd89f8d601871e5027b86b21984d1a6ef835bcf3c84')

