# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-safari-driver
pkgname="nodejs-$_pkgname"
pkgver=6.0.4
pkgrel=1
pkgdesc="Appium driver for Safari browser"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('8e057cba5a87f917247be0c1a639c5e862990aca6d7414170c902d51c8fe5ada')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
