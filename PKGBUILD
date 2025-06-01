# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=@appium/universal-xml-plugin
_scope="${_pkgname%%/*}"
_name="${_pkgname##*/}"
pkgname="nodejs-${_scope//@/}-$_name"
pkgver=1.0.34
pkgrel=1
pkgdesc="Appium plugin for making XML source and XPath queries the same across iOS and Android"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_name-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('e5217f7aaec313f26f63211302878550e758d956786c0ffa5aa74c99c64eeb44')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
