# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-safari-driver
pkgname="nodejs-$_pkgname"
pkgver=4.1.12
pkgrel=1
pkgdesc="Appium driver for Safari browser"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('66d225cd49ecfe4daa50b755e2d5f1d8ca3b6fddb7bea207e58c367b9e4952bf')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
