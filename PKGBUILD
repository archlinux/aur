# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-espresso-driver
pkgname="nodejs-$_pkgname"
pkgver=8.1.0
pkgrel=1
pkgdesc="Espresso integration for Appium"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('ddc2f2377532fb64a8e38b2dbbea653ebb73b8bfc76dc0014ce0e227910b530e')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
