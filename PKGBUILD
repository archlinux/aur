# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=@appium/images-plugin
_scope="${_pkgname%%/*}"
_name="${_pkgname##*/}"
pkgname="nodejs-${_scope//@/}-$_name"
pkgver=4.1.1
pkgrel=1
pkgdesc="Plugin for working with images and image elements in Appium"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_name-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('0cb18ed6276388a919b2bdb83f4890d7af18de20da6956e2c3e4077dcec8e8dd')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
