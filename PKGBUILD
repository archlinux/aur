# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-chromium-driver
pkgname="nodejs-$_pkgname"
pkgver=3.0.8
pkgrel=1
pkgdesc="Appium 2.x driver for Chromium-based browsers that work with Chromedriver"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('db1654959723c0580df31b315021b8dbf639721dcedf89ed4a50e9f80b9d3e46')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
