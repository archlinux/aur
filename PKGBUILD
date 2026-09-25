# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=@appium/execute-driver-plugin
_scope="${_pkgname%%/*}"
_name="${_pkgname##*/}"
pkgname="nodejs-${_scope//@/}-$_name"
pkgver=7.0.1
pkgrel=1
pkgdesc="Plugin for batching and executing driver commands with Appiums"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_name-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('f6af8ef8271176427be5be487b082d773e41fac9a963a043adfb61ab093f2a31')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
