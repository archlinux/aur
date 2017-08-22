# Maintainer: Oleksii Filonenko <filalex77@gmail.com>
pkgname=wallsplash
pkgver=0.1
pkgrel=3
pkgdesc="Set unsplash wallpapers with colorschemes"
url="https://github.com/filalex77/wallsplash/"
license=('GPL')
arch=('x86_64' 'x86')
depends=('feh' 'wal-git' 'nodejs-unsplash-wallpaper')
makedepends=('nodejs' 'npm')
optdepends=()
source=("$pkgname-$pkgver.tar.gz")
sha1sums=(SKIP)

package() {
	install -d "$pkgdir/usr/bin"
	cd "$pkgname-$pkgver"
	install -Dm755 wallsplash \
		"$pkgdir/usr/bin/wallsplash"
}
