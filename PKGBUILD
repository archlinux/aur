# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-uiautomator2-driver
pkgname="nodejs-$_pkgname"
pkgver=5.0.3
pkgrel=1
pkgdesc="UiAutomator2 integration for Appium"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('0283658914e80170da7c5ccb06bb6dc2358dc00f900b14922dbd8f310a122e97')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
