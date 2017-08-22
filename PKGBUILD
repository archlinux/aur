# Maintainer: Oleksii Filonenko <filalex77@gmail.com>
pkgname=wallsplash-git
pkgver=0.1
pkgrel=4
pkgdesc="Set unsplash wallpapers with colorschemes"
url="https://github.com/filalex77/wallsplash/"
license=('GPL')
arch=('x86_64' 'x86')
depends=('feh' 'wal-git' 'nodejs-unsplash-wallpaper')
makedepends=('nodejs' 'npm' 'git')
provides=('wallsplash')
source=("$pkgname"::'git+https://github.com/filalex77/wallsplash.git')
sha256sums=(SKIP)

package() {
	cd "$pkgname"
	install -Dm755 wallsplash \
		"$pkgdir/usr/bin/wallsplash"
}
