# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-mac2-driver
pkgname="nodejs-$_pkgname"
pkgver=3.3.0
pkgrel=1
pkgdesc="XCTest-based Appium driver for macOS apps automation"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('6067791c68a8eb44a41410e7669c332de4ce8cd998923beaf146a8e13d90e4df')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
