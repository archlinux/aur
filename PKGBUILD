# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-inspector-plugin
pkgname="nodejs-$_pkgname"
pkgver=2026.11.5
pkgrel=1
pkgdesc="An app inspector for use with an Appium server"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('d9b2fe9a210d5742c9b76d7dfdf9496b16b48915ec6c84b2c3500b68639df12e')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
