# Author: "Cowboy" Ben Alman (http://benalman.com/)
# Contributor: "Cowboy" Ben Alman (http://benalman.com/)
# Contributor: Kyle Robinson Young (http://dontkry.com/)
# Contributor: Tyler Kellen (http://goingslowly.com)
# Contributor: Sindre Sorhus (http://sindresorhus.com)
# Contributor: cowboy <cowboy@rj3.net>
# Contributor: tkellen <tyler@sleekcode.net>
# Contributor: cracoucass14

_npmname=grunt
pkgname=nodejs-grunt # All lowercase
pkgver=0.4.5
pkgrel=1
pkgdesc="The JavaScript Task Runner"
arch=(any)
url="http://gruntjs.com/"
license=(MIT)
depends=('nodejs')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha1sums=('56937cd5194324adff6d207631832a9d6ba4e7f0')

package() {
	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
