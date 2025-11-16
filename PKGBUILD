# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-windows-driver
pkgname="nodejs-$_pkgname"
pkgver=5.0.8
pkgrel=1
pkgdesc="Appium bridge to WinAppDriver"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('53a2e1d4c234c578018211ff846840937462e521c7f52a8a530eab048985d191')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
