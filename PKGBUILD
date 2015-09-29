# Maintainer: 3onyc <3onyc@x3tech.com>

pkgname=nodejs-cozy-dev
_npmname=cozy-dev
pkgver=1.0.24
pkgrel=1
pkgdesc="Tools to develop Cozy applications easily"
arch=('any')
depends=('nodejs')
makedepends=('npm')
url="https://github.com/cozy/cozy-dev"
license=('LGPLv3')
provides=('cozy-dev' 'nodejs-cozy-dev')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
