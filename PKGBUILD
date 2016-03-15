# Maintainer: alexiobash < me (at) alexiobash (dot) com >

pkgname=yaourt-gui
pkgver=1.5
pkgrel=2
pkgdesc="A bash GUI for yaourt"
arch=('any')
url=""https://github.com/alexiobash/yaourt-gui/wiki
license=('GPL')
depends=('yaourt' 'sudo' 'lsb-release' 'git')
optdepends=(
    'aurvote: Tool to vote for favorite AUR packages'
)
conflicts=('yaourt-gui-manjaro')
source=("$pkgname::git+http://git.alexiobash.com/git/$pkgname")
source=("$pkgname::git+https://github.com/alexiobash/$pkgname.git")
install="${pkgname}.install"
md5sums=('SKIP')

package() {
	cd $srcdir/$pkgname
	make DESTDIR=${pkgdir} install
}

