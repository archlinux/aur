# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-mac2-driver
pkgname="nodejs-$_pkgname"
pkgver=3.2.12
pkgrel=1
pkgdesc="XCTest-based Appium driver for macOS apps automation"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('f742a44d4ae14061dac5da2c0d59112a42a99231a12379e2846ba6b0c7b14c68')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
