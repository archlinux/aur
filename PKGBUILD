# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=@appium/execute-driver-plugin
_scope="${_pkgname%%/*}"
_name="${_pkgname##*/}"
pkgname="nodejs-${_scope//@/}-$_name"
pkgver=9.0.0
pkgrel=1
pkgdesc="Plugin for batching and executing driver commands with Appiums"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_name-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('7592ede485bd31746712748f9f53927bacd4ddac1bca07590bb4bfde78c93a26')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
