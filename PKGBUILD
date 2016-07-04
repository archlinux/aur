# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-riot
_npmname=riot
pkgver=2.5.0
pkgrel=1
pkgdesc="A React-like user interface micro-library"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://muut.com/riotjs"
license=('MIT')
provides=('riot' 'nodejs-riot')
conflicts=('riot')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
