# Maintainer: Joel Noyce Barnham <joelnbarnham@gmail.com>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
_npmname=json-diff
pkgname=nodejs-json-diff
pkgver=0.5.4
pkgrel=1
pkgdesc="JSON diff"
arch=(any)
url="https://github.com/andreyvit/json-diff"
license=()
depends=('nodejs' 'npm')
optdepends=()
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('81f7ce0aec1a8dbd8044753a0f786c25f1881a8c33068da0e05784ea083ff17a')

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" "$_npmname-$pkgver.tgz"
}
# vim:set ts=2 sw=2 et:
