# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-windows-driver
pkgname="nodejs-$_pkgname"
pkgver=4.4.1
pkgrel=1
pkgdesc="Appium bridge to WinAppDriver"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('66a7352bb8f2f9bed6d568ae98b03ab8ef3c7bf4e740709b40ec25f6f23263dd')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
