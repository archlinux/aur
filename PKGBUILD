# Substantially copied from the nodejs-forever package.

pkgname=iced-coffee-script
pkgver=108.0.11
pkgrel=1
pkgdesc="CoffeeScript with await/defer syntax added"
arch=(any)
url="https://maxtaco.github.io/coffee-script/"
license=()
depends=('nodejs')
makedepends=('npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha1sums=('1d71ff93c9049728a6468385aa9bc891fd74c58f')

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
