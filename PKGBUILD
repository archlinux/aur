# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-chromium-driver
pkgname="nodejs-$_pkgname"
pkgver=2.2.1
pkgrel=1
pkgdesc="Appium 2.x driver for Chromium-based browsers that work with Chromedriver"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('c327282dfb55f1032f7ed2edec27191ca554fc0c8076a18f6d009245b9551b8f')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
