# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-mac2-driver
pkgname="nodejs-$_pkgname"
pkgver=4.5.1
pkgrel=1
pkgdesc="XCTest-based Appium driver for macOS apps automation"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('97948b10e8a25336e3a2a5e1fdefb84bb3da83618caf880d0bda6a6641f483c5')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
