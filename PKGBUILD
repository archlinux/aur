# Maintainer: OmeGa <omega at mailoo dot org>

pkgname=nodejs-js2coffee
_npmname=js2coffee
pkgver=2.2.0
pkgrel=1
pkgdesc='JavaScript to CoffeeScript'
arch=('any')
depends=('nodejs' 'coffee-script')
makedepends=('npm')
url='http://js2.coffee/'
license=('MIT')
source=("$_npmname-$pkgver.tar.gz::https://github.com/$_npmname/$_npmname/archive/v$pkgver.tar.gz")
md5sums=('9e0d30f48288e549372cc19c24d52e65')

package() {
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install --user root -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tar.gz"
}
