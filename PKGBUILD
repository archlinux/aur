# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-safari-driver
pkgname="nodejs-$_pkgname"
pkgver=4.1.4
pkgrel=1
pkgdesc="Appium driver for Safari browser"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('0025aeb37f4db1ad950d2354a486b9d9ffcaa8fc1cd7d73440f5bf75d7c7bdf6')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
