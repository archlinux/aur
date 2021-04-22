# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=ice-store
pkgver=1.0.1
pkgrel=1
pkgdesc="A place for discovering SSBs"
arch=('any')
url="https://github.com/risiOS/ice-store"
license=('GPL')
depends=('ice' 'git' 'python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('fa214c3b7e2ea9f211de801c625daa91f9fad7e53b949c1cb75f8cfdd628205d')

package() {
	cd "$pkgname-$pkgver"
	cp -r usr "$pkgdir"
}
