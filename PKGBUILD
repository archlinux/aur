# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hp-smh-templates
pkgver=9.1.0.33_32
pkgrel=1
pkgdesc="HP System Management Homepage Templates"
arch=(any)
url="http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack"
depends=(bash hpsmh hp-snmp-agents)
groups=(hpproliant)
license=("CUSTOM")

source=(http://downloads.linux.hp.com/SDR/downloads/ProLiantSupportPack/RedHatEnterpriseServer/6.2/packages/i386/${pkgname}-${pkgver//_/-}.all.noarch.rpm)

package() {
	cp -a "$srcdir/"{opt,usr} "$pkgdir"
}

sha256sums=('0dec3899b63501db273ca09eeb918c8c97500c87043d5238da237954726be693')

