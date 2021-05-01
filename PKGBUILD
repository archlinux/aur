# Maintainer: u0_a266 <cagf2emv@anonaddy.me>
pkgname=fzpac-git
_pkgname=fzpac
pkgver=latest
pkgrel=3
pkgdesc="Arch Linux (pacman) package finder with fzf "
arch=("any")
url="https://github.com/sheepla/fzpac"
license=('MIT')
depends=("fzf" "pacman")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/$_pkgname
	printf "%s" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 fzpac "$pkgdir/usr/local/bin/fzpac"
}

