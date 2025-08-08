# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-espresso-driver
pkgname="nodejs-$_pkgname"
pkgver=4.1.16
pkgrel=1
pkgdesc="Espresso integration for Appium"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('f712baa3c9dcd4fb8ff0dc9728da02cf6f9c4d4d9975e805effea0e81baac820')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
