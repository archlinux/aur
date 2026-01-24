# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-inspector-plugin
pkgname="nodejs-$_pkgname"
pkgver=2026.1.3
pkgrel=1
pkgdesc="An app inspector for use with an Appium server"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('4b1d48b4b59589bff5b449d024ec18876d5cbb694548db104bd08eb4e41c1124')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
