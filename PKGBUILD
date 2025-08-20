# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-geckodriver
pkgname="nodejs-$_pkgname"
pkgver=2.0.3
pkgrel=1
pkgdesc="Appium driver for Gecko-based browsers and web views"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('87c9ca498a10bf55d4d6a0067e3a07d6db83a568eafed74b9075a3f26aeee4c9')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
