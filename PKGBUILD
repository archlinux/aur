# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=@appium/relaxed-caps-plugin
_scope="${_pkgname%%/*}"
_name="${_pkgname##*/}"
pkgname="nodejs-${_scope//@/}-$_name"
pkgver=2.1.0
pkgrel=1
pkgdesc="An Appium 2.0 plugin that loosens requirements for vendor prefixes on caps"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_name-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('9e68d09ef96cbcb6b1f8fa178faf473675872b9c59cbff0b764dcb5c9c92f120')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
