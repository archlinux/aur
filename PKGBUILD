# Maintainer: alexiobash < me (at) alexiobash (dot) com >

pkgname=yaourt-gui
pkgver=1.2
pkgrel=4
pkgdesc="A bash GUI for yaourt"
arch=('any')
url="http://alexiobash.com/yaourt-gui-a-bash-gui-per-yaourt-3/"
license=('GPL')
depends=('yaourt' 'sudo')
optdepends=(
    'aurvote: Tool to vote for favorite AUR packages'
)
source=("$pkgname::git+http://git.alexiobash.com/git/$pkgname")
install="${pkgname}.install"
md5sums=('SKIP')

package() {
	cd $srcdir/$pkgname
	make DESTDIR=${pkgdir} install
}

