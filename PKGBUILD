# Maintainer: Ariel Popper <a@arielp.com>

_gitname=termite

pkgname=termite-terminfo
pkgver=7
pkgrel=1
pkgdesc="Just the terminfo for termite (A Simple VTE-based terminal)"
arch=('any')
url="https://github.com/thestinger/termite/"
license=('LGPL')
makedepends=('ncurses' 'git')
source=("$_gitname::git+https://github.com/thestinger/termite#tag=v$pkgver")
md5sums=('SKIP')

package() {
	cd "$srcdir/$_gitname"
	install -d "$pkgdir/usr/share/terminfo/x"
	tic termite.terminfo -o"$pkgdir/usr/share/terminfo"
}
