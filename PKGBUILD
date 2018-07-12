# Maintainer: Merrick Luo <merrick@luois.me>
pkgname=ieasemusic
pkgver=1.2.4
pkgrel=0
pkgdesc='Elegant neteaseMusic desktop app, Rock with NeteaseMusic.'
arch=('x86_64')
url='https://github.com/trazyn/ieaseMusic'
license=('MIT')
_rpmname="ieaseMusic-${pkgver}-linux-x86_64.rpm"
depends=(gtk2 gconf)
makedepends=()
options=()
source=("https://github.com/trazyn/ieaseMusic/releases/download/v${pkgver}/${_rpmname}")
sha1sums=('ae529645675974bbe2de37ffd19f4796ac6df690')
install='iease-music.install'

package() {
	cp -r ${srcdir}/opt ${pkgdir}/
	cp -r ${srcdir}/usr ${pkgdir}/
	mkdir -p ${pkgdir}/usr/bin/
	ln -s /opt/ieaseMusic/iease-music ${pkgdir}/usr/bin/
}
