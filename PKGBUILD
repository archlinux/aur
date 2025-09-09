# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=@appium/storage-plugin
_scope="${_pkgname%%/*}"
_name="${_pkgname##*/}"
pkgname="nodejs-${_scope//@/}-$_name"
pkgver=1.0.1
pkgrel=1
pkgdesc="Appium plugin for server-side file storage"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_name-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('ae2688684e7b948b07c75cc1ec6b8d5e2cce5e38257cde7025809d7d3c47f54f')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
