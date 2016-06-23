# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-superstatic
_npmname=superstatic
pkgver=4.0.3
pkgrel=1
pkgdesc="A static file server for fancy apps"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://github.com/firebase/superstatic"
license=('MIT')
provides=('superstatic' 'nodejs-superstatic')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
