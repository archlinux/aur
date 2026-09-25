# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=@appium/relaxed-caps-plugin
_scope="${_pkgname%%/*}"
_name="${_pkgname##*/}"
pkgname="nodejs-${_scope//@/}-$_name"
pkgver=3.0.1
pkgrel=1
pkgdesc="An Appium 2.0 plugin that loosens requirements for vendor prefixes on caps"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_name-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('573ad19e051355157d2efe91a394b4170e61b88fdd8930df090ef8f46c8fc33a')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
