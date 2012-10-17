# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hponcfg
pkgver=3.1.1.0.2_2
pkgrel=1
pkgdesc="RILOE II/iLo online configuration utility"
arch=(i686 x86_64)
url="http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack"
depends=(hp-health libxslt)
groups=(hpproliant)
license=("CUSTOM")

[ $CARCH = "x86_64" ] && depends=(${depends[@]} lib32-glibc)

source=(http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack/pool/non-free/${pkgname}_${pkgver//_/-}_i386.deb)

package() {
	cd "$pkgdir"
	tar xf "$srcdir/data.tar.gz"
}

sha256sums=('2e145c40e20808398fccbdba7f798020ed6fdf65059f634f5351d6ecbc867b99')
