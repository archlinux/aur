# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hp-smh-templates
pkgver=10.2.0_1429.26
pkgrel=1
pkgdesc="HP System Management Homepage Templates"
arch=(any)
url="http://downloads.linux.hp.com/SDR/downloads/mcp"
depends=(bash hpsmh hp-snmp-agents)
groups=(hpproliant)
license=("CUSTOM")

source=(http://downloads.linux.hp.com/SDR/downloads/mcp/centos/7/x86_64/current/${pkgname}-${pkgver//_/-}.noarch.rpm)
sha256sums=('2f1cb2337b044a505ddb12826870a7f573f9050982711af53d36b5e45f0d78b1')

package() {
	cp -a "$srcdir/"{opt,usr} "$pkgdir"
}
