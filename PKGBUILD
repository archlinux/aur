# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=etckeeper-packages
pkgver=0.1.1
pkgrel=1
pkgdesc='Track installed packages in etckeeper (alternative to pug and pacmanity)'
url="https://github.com/alerque/$pkgname"
arch=(any)
license=(GPL-3.0-only)
depends=(etckeeper
         pacman)
_archive="$pkgname-$pkgver"
source=("https://github.com/alerque/$pkgname/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('fff62c3dddf0f8a4f542d92577ca49d9d0f57cfbc329e55d0a51caf694c8850d')

package() {
	cd "$_archive"
	make DESTDIR="$pkgdir" install
}
