# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hp-smh-templates
pkgver=9.5.0_1358.30
pkgrel=1
pkgdesc="HP System Management Homepage Templates"
arch=(any)
url="http://downloads.linux.hp.com/SDR/downloads/mcp"
depends=(bash hpsmh hp-snmp-agents)
groups=(hpproliant)
license=("CUSTOM")

source=(http://downloads.linux.hp.com/SDR/downloads/mcp/centos/6/x86_64/current/${pkgname}-${pkgver//_/-}.noarch.rpm)

package() {
	cp -a "$srcdir/"{opt,usr} "$pkgdir"
}

sha256sums=('0dedcf4611357988e0f93129e73c851ce71d01c464208911a430e670d70330ef')

