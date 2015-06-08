# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=Invisible-Black
pkgname=plasma-theme-invisible-black
pkgver=0.7
pkgrel=2
pkgdesc="Invisible Plasma Theme for KDE4. Black color variant."
arch=('any')
license=('GPL')
url="http://kde-look.org/content/show.php/Invisible?content=164089"
depends=('kdebase-workspace')
source=($_pkgname-$pkgver.tar.gz::'https://copy.com/sJZnwoqxps8Z/Invisible-Black.tar.gz?download=1')
md5sums=('360686389ca65dae8766e0f4e2e2ec8d')

package() {
   cd $srcdir
   mkdir -p $pkgdir/usr/share/apps/desktoptheme/
   cp -R $_pkgname $pkgdir/usr/share/apps/desktoptheme/
}