# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-mac2-driver
pkgname="nodejs-$_pkgname"
pkgver=3.2.8
pkgrel=1
pkgdesc="XCTest-based Appium driver for macOS apps automation"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('158d01b276fc874ea8f7c0161c1e7773bb7201a8aa731fa975cf608bb4a1980e')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
