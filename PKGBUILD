# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-geckodriver
pkgname="nodejs-$_pkgname"
pkgver=2.1.5
pkgrel=1
pkgdesc="Appium driver for Gecko-based browsers and web views"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('8888e0fe58b5cf2c5830e812bb5d28a7692dac3d9ac553a1096689e4fc566444')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
