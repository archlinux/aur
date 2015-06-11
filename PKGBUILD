# Maintainer: OmeGa <omega at mailoo dot org>

pkgname=nodejs-js2coffee
_npmname=js2coffee
pkgver=2.0.4
pkgrel=1
pkgdesc='JavaScript to CoffeeScript'
arch=('any')
depends=('nodejs' 'coffee-script')
url='http://js2.coffee/'
license=('MIT')
source=("$_npmname-$pkgver.tar.gz::https://github.com/$_npmname/$_npmname/archive/v$pkgver.tar.gz")
md5sums=('c53a93310d90e1f5c1f5e553d8ad620c')

package() {
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install --user root -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tar.gz"
}
