# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-xcuitest-driver
pkgname="nodejs-$_pkgname"
pkgver=9.6.1
pkgrel=1
pkgdesc="Appium driver for iOS using XCUITest for backend"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('3a7b0572bbff6bc8999fe28ae65a2c2cc0505da86c89ac24aa3af8e49cc3691e')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
