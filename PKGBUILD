# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-windows-driver
pkgname="nodejs-$_pkgname"
pkgver=5.1.1
pkgrel=1
pkgdesc="Appium bridge to WinAppDriver"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('f67430b5e56f611c1ecadf6c513966016a92ccd39fa1c92c6e48efa50c56e9b7')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
