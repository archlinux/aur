# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-xcuitest-driver
pkgname="nodejs-$_pkgname"
pkgver=10.1.4
pkgrel=1
pkgdesc="Appium driver for iOS using XCUITest for backend"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('219e357765d43ce931367df7bf7f7604e7da4cfaae528cbf961321f97e7c036b')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
