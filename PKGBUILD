# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=arch-package-download
pkgver=3
pkgrel=1
pkgdesc="Download a package using your pacman configuration "
arch=('any')
url="https://github.com/42LoCo42/arch-package-download"
license=('AGPL')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cd62a43ef5cad9d2b4a8651b9cd419b9b66c231a3dd31d88a79896b2b2934b7f')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
