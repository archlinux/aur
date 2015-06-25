# Maintainer: alexandru.ianu@gmail.com

pkgname=yaourt-gui-manjaro
pkgver=1.1.5
pkgrel=1
pkgdesc="A bash GUI for yaourt - Manjaro theming"
arch=('any')
url="http://www.alexiobash.com/yaourt-gui-a-bash-gui-per-yaourt-3/"
license=('GPL')
depends=('yaourt' 'sudo' 'xdg-utils' 'desktop-file-utils')
optdepends=('pacmind' 'pacman-color' 'aurvote')
provides=('yaourt-gui')
conflicts=('yaourt-gui')
source=("https://www.dropbox.com/s/u7h8yi7n4rqimp6/yaourt-gui-manjaro-1.1.5.tar.gz")

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=${pkgdir} install
}


sha256sums=('e5beb0a3dfc2eb73b29b142f78a88abf4ca25178f809fb18d0c9ee865050c7c4')
