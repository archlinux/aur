# Maintainer: Your Name <youremail@domain.com>
pkgname=fzpac-git
_pkgname=fzpac
pkgver=latest
pkgrel=1
pkgdesc="Arch Linux (pacman) package finder with fzf "
arch=("any")
url="https://github.com/sheepla/fzpac"
license=('custom')
depends=("fzf" "pacman")
source=("git+$url")
sha256sums=('SKIP')

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 fzpac "$pkgdir/usr/local/bin/fzpac"
}

