# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-geckodriver
pkgname="nodejs-$_pkgname"
pkgver=3.0.1
pkgrel=1
pkgdesc="Appium driver for Gecko-based browsers and web views"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('dd6ab3e97e5b4bb5758f0645876e0808ecc485e662ad65407e5dd70d9b579616')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
