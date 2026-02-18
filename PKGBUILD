# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-espresso-driver
pkgname="nodejs-$_pkgname"
pkgver=6.4.0
pkgrel=1
pkgdesc="Espresso integration for Appium"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('cd89ff4f2ccc320ced045ff187942719deb79fee7e520b66aa0188b0498cb500')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
