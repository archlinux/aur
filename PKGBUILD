# Maintainer: Adrian Berriel <berriel[at]gmail[dot]com>

pkgname=plasma-theme-helium
pkgver=5.0.0
pkgrel=1
pkgdesc="Transparent theme based on air and eleonora. but giving it an extra touch"
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-look.org/content/show.php/Helium?content=125471"
depends=('kdebase-workspace') 
conflicts=('plasma-theme-gremix')
source=("http://kde-look.org/CONTENT/content-files/125471-Helium.tar.xz")
md5sums=('f0a03eaa13b09e19d8f5d75001a8dae1')

package() {

  mkdir -p $pkgdir/usr/share/apps/desktoptheme
  cd $srcdir
  cp -r Helium $pkgdir/usr/share/apps/desktoptheme
  chmod -R 755 $pkgdir/usr/share/apps/desktoptheme/Helium

}
