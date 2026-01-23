# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-chromium-driver
pkgname="nodejs-$_pkgname"
pkgver=2.1.2
pkgrel=1
pkgdesc="Appium 2.x driver for Chromium-based browsers that work with Chromedriver"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('48766ae06d0218596d815b9d82ccf2dac002bf4c9a8f5d76d298a6751214f348')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
