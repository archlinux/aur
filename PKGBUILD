# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-xcuitest-driver
pkgname="nodejs-$_pkgname"
pkgver=12.11.0
pkgrel=1
pkgdesc="Appium driver for iOS using XCUITest for backend"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('954f4b554266c8f1ada211b1a13ff5fea467581a8830873c095363ac94690e4d')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
