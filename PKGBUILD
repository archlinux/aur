# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>

pkgname=plasma-theme-tilain
_themename=Tilain
pkgver=0.3.2
pkgrel=1
pkgdesc="Tilain is a simple theme for the KDE Plasma"
arch=('any')
license=('CCPL')
url="http://kde-look.org/content/show.php/Tilain+Plasma?content=162768"
depends=('kdebase-workspace')
source=("http://q.gs/4869882/tilainplasma")
md5sums=('129556d61fa30bf1d004d280ae3f5260')

package() {
	install -Dm644 $_themename/LICENSE $pkgdir/usr/share/licenses/$pkgname

	mkdir -p $pkgdir/usr/share/apps/desktoptheme
	mv $srcdir/$_themename $pkgdir/usr/share/apps/desktoptheme
	chmod 755 -R $pkgdir/usr/share/apps/desktoptheme/$_themename
}