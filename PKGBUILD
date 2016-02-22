# Maintainer: goetzc

pkgname=plasma5-themes-elune
_themename=Elune
pkgver=1.2
pkgrel=1
pkgdesc="An theme designed by Sean Wilson"
arch=('any')
license=('GPL')
url="http://half-left.deviantart.com/art/Elune-For-Plasma-5-558192192"
depends=('plasma-workspace')
source=("http://orig14.deviantart.net/6d8c/f/2015/326/5/f/elune_for_plasma_5_by_half_left-d98bzuo.zip")
sha256sums=('6be8ebbabe6154057b46256b079ff7d4a472572d3c1e32e654ee34da6f9b1ef5')

package() {
  cd $srcdir

  install -Dm644 $_themename/COPYING $pkgdir/usr/share/licenses/$pkgname

  install -d $pkgdir/usr/share/plasma/desktoptheme/
  mv $srcdir/$_themename $pkgdir/usr/share/plasma/desktoptheme/
  chmod 755 -R $pkgdir/usr/share/plasma/desktoptheme/$_themename
}
