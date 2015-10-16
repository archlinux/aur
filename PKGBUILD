# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=gtk-theme-lx-colors
pkgver=1
pkgrel=1
pkgdesc="GTK2/GTK3/Openbox remake of the Shiki-Colors theme series."
arch=('any')
depends=('gtk-engine-murrine')
url="http://box-look.org/content/show.php/LX-Colors?content=171307"
license=('GPL')
source=("https://copy.com/499YK3JYHbcxzNL3/LX-Colors-by-color.tar.bz2")
sha256sums=('c5c7df3ab87cabfe0d81c338778faaa56ce3c8ae80eb7d17889747368f61376d')

package() {
  install -d -m755 $pkgdir/usr/share/themes

  cd $srcdir/LX-Colors-by-color
  mv LX* $pkgdir/usr/share/themes/
}
