# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hp-smh-templates
pkgver=8.7.0.1.4_4
pkgrel=1
pkgdesc="HP System Management Homepage Templates"
arch=(any)
url="http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack"
depends=(bash hpsmh hp-snmp-agents)
groups=(hpproliant)
license=("CUSTOM")

source=(http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack/pool/non-free/${pkgname}_${pkgver//_/-}_all.deb)

package() {
	cd "$pkgdir"
	tar xf "$srcdir/data.tar.gz"
}

sha256sums=('51df8502b2b27e5b81f8c864736752df0a97147cbecea2ea709005fe1f2c3d2b')

