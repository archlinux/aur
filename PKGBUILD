# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-jspm
_npmname=jspm
pkgver=0.16.33
pkgrel=1
pkgdesc="Registry and format agnostic JavaScript package manager"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://github.com/jspm/jspm"
license=('Apache')
provides=('jspm' 'nodejs-jspm')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
