# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-jsxhint
_npmname=jsxhint
pkgver=0.15.1
pkgrel=1
pkgdesc="Wrapper for JSHint to allow hinting of JSX files"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://github.com/STRML/JSXHint"
license=('MIT')
provides=('jsxhint' 'nodejs-jsxhint')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
