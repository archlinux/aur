# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hp-smh-templates
pkgver=10.5.0_1462.26
pkgrel=1
pkgdesc="HP System Management Homepage Templates"
arch=(any)
url="http://downloads.linux.hpe.com/SDR/downloads/mcp"
depends=(bash hpsmh hp-snmp-agents)
groups=(hpproliant)
license=("CUSTOM")

source=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/7/x86_64/current/${pkgname}-${pkgver//_/-}.noarch.rpm")
sha256sums=('749bd870f82c18bc312c8cd21cfa90550d49aa115032f704de7dbf3ee3db79b8')

package() {
	cp -a "$srcdir/"{opt,usr} "$pkgdir"
}
