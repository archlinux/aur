# Yaourt-gui maintainer: alexiobash < me (at) alexiobash (dot) com >
# Conversion maintainer: alexandru.ianu@gmail.com

pkgname=yaourt-gui-manjaro
pkgver=1.4.5
pkgrel=2
pkgdesc="A bash GUI for yaourt (Manjaro theming) and Romanian translation added"
arch=('any')
url="http://alexiobash.com/yaourt-gui-a-bash-gui-per-yaourt-3/"
license=('GPL')
depends=('yaourt' 'sudo')
optdepends=(
    'aurvote: Tool to vote for favorite AUR packages'
)
provides=('yaourt-gui')
conflicts=('yaourt-gui')
source=("$pkgname::git+https://github.com/alexandruianu/$pkgname")
install="${pkgname}.install"
md5sums=('SKIP')

package() {
	cd $srcdir/$pkgname
	make DESTDIR=${pkgdir} install
}


