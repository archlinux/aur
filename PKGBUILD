# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-geckodriver
pkgname="nodejs-$_pkgname"
pkgver=2.2.4
pkgrel=1
pkgdesc="Appium driver for Gecko-based browsers and web views"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('1b51f45089f69e8a56b57e56b1339d1b5ff65c6054ffa713d2af183538081708')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
