# Maintainer: Leon Schumacher <leonsch@protonmail.com>
# vim: ft=sh:
pkgname=arch-package-download
pkgver=4
pkgrel=1
pkgdesc="Download a package using your pacman configuration "
arch=('any')
url="https://github.com/42LoCo42/arch-package-download"
license=('AGPL')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('abb5d5dde75294240e80514a69575d261a20c9ef21cb1bd3d5ffa008f4fc7731')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
