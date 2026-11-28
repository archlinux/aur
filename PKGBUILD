# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-xcuitest-driver
pkgname="nodejs-$_pkgname"
pkgver=13.8.3
pkgrel=1
pkgdesc="Appium driver for iOS using XCUITest for backend"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('7ef4fe97f6053ab6b1d25d9831cd5e7474f5ba04639459953953cf5d1a45789e')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
