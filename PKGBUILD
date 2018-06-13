# Maintainer: Jason Ryan <jasonwryan@gmail.com>
# Contributor: Marco Curreli <marcocurreli@tiscali.it>

pkgname=stardict-oald
pkgver=2.4.2
pkgrel=8
pkgdesc="Oxford Advanced Learner's Dictionary for Stardict"
license=('freeware')
arch=('any')
depends=('stardict')
url="http://stardict.sourceforge.net"
md5sums=('5f4adc8b3cd13b8574716171d1b42f82')
source=(http://distcache.freebsd.org/ports-distfiles/stardict/${pkgname}-${pkgver}.tar.bz2)

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/share/stardict/dic/oald"
	install -m 644 oald.dict.dz oald.idx oald.ifo "$pkgdir/usr/share/stardict/dic/oald/"
}

# vim:set ts=2 sw=2 et:
