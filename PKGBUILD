# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=@appium/universal-xml-plugin
_scope="${_pkgname%%/*}"
_name="${_pkgname##*/}"
pkgname="nodejs-${_scope//@/}-$_name"
pkgver=4.0.0
pkgrel=1
pkgdesc="Appium plugin for making XML source and XPath queries the same across iOS and Android"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_name-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('bcb6e869d5064c030b95ee3204377a1ebd475f7b397f1870fe78cacf799d42ab')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
