# Maintainer icasdri <icasdri at gmail dot com>

_npmname=swagger-dsl
pkgname=swagger-dsl
pkgver=0.2.2
pkgrel=1
pkgdesc="CoffeeScript-based domain-specific language for generating JSON documents for Swagger"
arch=(any)
url="https://github.com/intellinote/swagger-dsl"
license=('MIT')
depends=('nodejs')
makedepends=('npm')

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}
