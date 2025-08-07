# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-uiautomator2-driver
pkgname="nodejs-$_pkgname"
pkgver=4.2.8
pkgrel=1
pkgdesc="UiAutomator2 integration for Appium"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('f2449d5f738a47a8ad74f5312a690224f5070e35b3c51904e546d7ae57436332')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
