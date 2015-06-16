# Maintainer: alexiobash < me (at) alexiobash (dot) com >

pkgname=yaourt-gui
pkgver=1.2
pkgrel=3
pkgdesc="A bash GUI for yaourt"
arch=('any')
url="http://alexiobash.com/yaourt-gui-a-bash-gui-per-yaourt-3/"
license=('GPL')
depends=('yaourt' 'sudo')
optdepends=(
    'pacmind: a gtkdialog frontend gui for the package manager, inspired to yaourt-gui'
    'aurvote: Tool to vote for favorite AUR packages'
)
source=("http://mirror.alexiobash.com/alexiobash/project/yaourt-gui/$pkgname-$pkgver.tar.gz")
md5sums=('c20bce0f2488193c038952c95d500dfe')

package() {
	cd $srcdir/$pkgname
	make DESTDIR=${pkgdir} install
}
