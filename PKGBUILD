# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-inspector-plugin
pkgname="nodejs-$_pkgname"
pkgver=2025.7.1
pkgrel=1
pkgdesc="An app inspector for use with an Appium server"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('3bd92f8a4f56e00ded949662950704ac2744cdf42edb3a38d3e83d91ceba2242')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
