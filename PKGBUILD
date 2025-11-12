# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=@appium/universal-xml-plugin
_scope="${_pkgname%%/*}"
_name="${_pkgname##*/}"
pkgname="nodejs-${_scope//@/}-$_name"
pkgver=2.0.2
pkgrel=1
pkgdesc="Appium plugin for making XML source and XPath queries the same across iOS and Android"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_name-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('39cca84c683b5d984f8668f04f15d3c35c6ddaa44c7a3fd3cd79ca737aca3ef8')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
