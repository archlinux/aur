# Maintainer Mircea Mihalea <mircea at mihalea dot ro>

_npmname=icon-font-generator
pkgname=nodejs-icon-font-generator
pkgver=2.1.10
pkgrel=1
pkgdesc='Easy-to-use cli tool to generate webfont icon kits from a bunch of .svg files'
arch=('any')
license=('MIT')
url="https://www.npmjs.com/package/icon-font-generator"
depends=('nodejs' 'npm')
provides=("$_npmname")
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
md5sums=("086ae31994e8f45bca0d4cd93e4e0bfa")

package() {
	cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver	
}

# vim:set ts=2 sw=2 et:
