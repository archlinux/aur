# Maintainer: alexiobash < me (at) alexiobash (dot) com >

pkgname=pacmind
pkgver=2.5
pkgrel=4
pkgdesc="A gtkdialog frontend gui for the package manager, inspired to yaourt-gui"
arch=('any')
url="http://www.xfce-italia.it/index.php?topic=636.0"
license=('GPL')
depends=('gtkdialog' 'zenity' 'yaourt' 'xterm' 'sudo' 'pkgbrowser' 'git')
optdepends=(
    'aurvote: Tool to vote for favorite AUR packages'
    'yaourt-gui: A bash GUI for yaourt'
)
source=("$pkgname::git+http://git.alexiobash.com/git/$pkgname")
install="${pkgname}.install"
md5sums=('SKIP')


package() {
	cd $srcdir/$pkgname
	make DESTDIR=${pkgdir} install
}
