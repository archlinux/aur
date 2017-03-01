# Author: Christoph Brill <egore911@gmail.com>

_npmname=carto

pkgname=nodejs-carto
pkgver=0.17.2
pkgrel=1
pkgdesc="Mapnik Stylesheet Compiler"
arch=(any)
url="https://github.com/mapbox/carto"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
md5sums=('a3757ce73b5885a2fe3bd9e735de91c1')

package() {
	npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
}
