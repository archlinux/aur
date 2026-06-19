# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-espresso-driver
pkgname="nodejs-$_pkgname"
pkgver=8.6.2
pkgrel=1
pkgdesc="Espresso integration for Appium"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('19535be1d2ec680b9bd5c9c7b00d21938f937b5f17983bae767fb6a9335b9fb9')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
