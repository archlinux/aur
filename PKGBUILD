# Maintainer: Jason Ryan <jasonwryan@gmail.com>
# Contributor: Marco Curreli <marcocurreli@tiscali.it>

pkgname=stardict-oald
pkgver=2.4.2
pkgrel=7
pkgdesc="Oxford Advanced Learner's Dictionary for Stardict"
license=('freeware')
arch=('any')
depends=('stardict')
url="http://stardict.sourceforge.net"
md5sums=('5f4adc8b3cd13b8574716171d1b42f82')
validpgpkeys=('7817E3FF578EEEE19F64D40C445E52EAB1BD4E40')  # jason ryan
source=(http://distcache.freebsd.org/ports-distfiles/stardict/${pkgname}-${pkgver}.tar.bz2)

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/share/stardict/dic/"
	install -m 644 oald.dict.dz oald.idx oald.ifo "$pkgdir/usr/share/stardict/dic/"
}
