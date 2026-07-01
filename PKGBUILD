# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-safari-driver
pkgname="nodejs-$_pkgname"
pkgver=5.0.4
pkgrel=1
pkgdesc="Appium driver for Safari browser"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('aa55065b726050fa5abd096096f5c18f13354b883641fcb5e6e7aa3607fe1fe4')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
