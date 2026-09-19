# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-xcuitest-driver
pkgname="nodejs-$_pkgname"
pkgver=12.12.6
pkgrel=1
pkgdesc="Appium driver for iOS using XCUITest for backend"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('8d806d4a3e6309510ba937d88af05f0831eeddda47faca0ab70c1cfdda54a03f')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
