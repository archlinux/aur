# Contributor: Marc Poiroud <marci1 AT archlinux.fr> & Paul Robin <paul.robin AT club-internet.fr>

pkgname=man-pages-pacman-fr
pkgver=20090803
pkgrel=3
pkgdesc="Pages francophone de manuel de Pacman-3.3"
arch=('any')
url="https://archlinux.fr"
license=('GPL')
depends=('pacman>=3.3')
groups=('manpagesfr')
conflicts=('pacman.manfr')
replaces=('pacman.manfr')
source=("http://poiroud.free.fr/linux/archlinux/pacman.manfr/pacman.manfr-$pkgver.tar.gz")
md5sums=('10aaf58f5d3eeb6de78c099d6a880d2b')

package() {
	cd "pacman.manfr"
	make DESTDIR="$pkgdir/" install
}

# vim: set ft=sh ts=4 sw=4 noet:
