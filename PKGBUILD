# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-windows-driver
pkgname="nodejs-$_pkgname"
pkgver=6.0.0
pkgrel=1
pkgdesc="Appium bridge to WinAppDriver"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('60c5994b21b5da852894137dc9bb4ca4265099a7c15408ff9e7e8d254b54bfdc')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
