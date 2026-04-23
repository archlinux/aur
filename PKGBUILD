# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=@appium/execute-driver-plugin
_scope="${_pkgname%%/*}"
_name="${_pkgname##*/}"
pkgname="nodejs-${_scope//@/}-$_name"
pkgver=6.0.2
pkgrel=1
pkgdesc="Plugin for batching and executing driver commands with Appiums"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_name-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('3ea658fa3bc451249da97e5bf0c8a19144fc56428f8a632e6b43db3fe54e9bc6')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
