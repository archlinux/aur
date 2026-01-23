# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-uiautomator2-driver
pkgname="nodejs-$_pkgname"
pkgver=6.7.11
pkgrel=1
pkgdesc="UiAutomator2 integration for Appium"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('4c2f2c6ecafd511ff943657b5b7ff92ce5fa0d95d84c9455f3bf2dad77ab5bb6')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
