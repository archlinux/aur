# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=nodejs-grasp
_npmname=grasp
pkgver=0.3.0
pkgrel=1
pkgdesc="JavaScript structural search, replace, and refactor"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="http://graspjs.com/"
license=('MIT')
provides=('grasp' 'nodejs-grasp')
conflicts=('grasp')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
