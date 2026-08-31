# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-safari-driver
pkgname="nodejs-$_pkgname"
pkgver=5.0.8
pkgrel=1
pkgdesc="Appium driver for Safari browser"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('57a367d8f7e102b4018687bd30035afd004e1eeceb01e96567f41f8d4b5bb1de')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
