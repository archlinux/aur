# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-mac2-driver
pkgname="nodejs-$_pkgname"
pkgver=4.3.5
pkgrel=1
pkgdesc="XCTest-based Appium driver for macOS apps automation"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('00f741c56b78c5f4a547bb331c4a209289d47181abbda1be390bdb04d08d204d')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
