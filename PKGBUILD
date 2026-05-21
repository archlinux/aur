# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
_pkgname=appium-uiautomator2-driver
pkgname="nodejs-$_pkgname"
pkgver=7.5.1
pkgrel=1
pkgdesc="UiAutomator2 integration for Appium"
arch=('x86_64')
url="https://www.npmjs.com/package/$_pkgname"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
noextract=("$pkgname-$pkgver.tgz")
sha256sums=('9a054213bf1aa98165a11f34494c9cc36815efebb660751409e7277217c4e727')

package() {
  npm install -g --prefix "$pkgdir/usr" --cache "$srcdir/npm-cache" "$srcdir/$pkgname-$pkgver.tgz"
}
