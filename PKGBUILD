# Maintainer: Pietro Francesco Fontana <pietrofrancesco.fontana@studenti.unimi.it>

pkgname=cleanupdate-git
pkgver=0.2
pkgrel=1
pkgdesc="A simple script to speed up updating and cleaning your system"
arch=('any')
url="https://github.com/cubanpit/cleanupdate"
license=('GPL3')
depends=('ncurses')
makedepends=('git')
optdepends=('yaourt: update packages from AUR repository (alternative to pacaur)'
		'pacaur: update packages from AUR repository (alternative to yaourt)')
conflicts=()
source=("git://github.com/cubanpit/cleanupdate")
md5sums=('SKIP')

package () {
	cd "$srcdir"
		install -Dm755 "$srcdir/cleanupdate/cleanupdate" "$pkgdir/usr/bin/cleanupdate"
}
