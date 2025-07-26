# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-windows-driver
pkgname="nodejs-$_pkgname"
pkgver=4.4.5
pkgrel=1
pkgdesc="Appium bridge to WinAppDriver"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('6482761375361c2e6866bf3a7d99fd25b45399cdfc0c5d4134a6ede8984daee6')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
