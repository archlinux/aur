# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-espresso-driver
pkgname="nodejs-$_pkgname"
pkgver=6.3.2
pkgrel=1
pkgdesc="Espresso integration for Appium"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('4a8a5815436eb14af9da92b1c91d567267639d27e2a5f6613e7f49b9dffc57d5')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
