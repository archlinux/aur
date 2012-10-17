# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hp-snmp-agents
pkgver=8.7.0.1.7_8
pkgrel=1
pkgdesc="Insight Management SNMP Agents for HP ProLiant Systems"
arch=(i686 x86_64)
url="http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack"
depends=(bash hp-health ethtool pciutils net-snmp)
groups=(hpproliant)
license=("CUSTOM")

[ $CARCH = "x86_64" ] && depends=(${depends[@]} lib32-gcc-libs)

source=(http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack/pool/non-free/${pkgname}_${pkgver//_/-}_i386.deb)

package() {
	cd "$pkgdir"
	tar xf "$srcdir/data.tar.gz"
}

sha256sums=('198ed76cdf1874e72f586172e4921ae1ac76cb37d38feff602f6ff43e944fba4')

