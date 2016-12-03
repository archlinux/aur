# Maintainer: Jacob Mischka <jacob@mischka.me>
pkgname=notes-git
pkgver=20161202
pkgrel=1
pkgdesc="Simple delightful note taking, with more unix and less lock-in."
arch=('any')
url="https://github.com/pimterry/notes"
license=('MIT')
depends=()
makedepends=('git')
provides=('notes')
source=('git+https://github.com/pimterry/notes.git')
md5sums=('SKIP')

_gitroot=notes

package() {
	cd "$srcdir/$_gitroot"
	install -D notes "$pkgdir/usr/bin/notes"
}
