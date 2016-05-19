# Maintainer: RedTide
pkgname=gtk-theme-glossyblack
pkgver=0.2.0
pkgrel=1
pkgdesc="GTK2, GTK3, Metacity, XFCE4 theme."
arch=('any')
url="http://gnome-look.org/content/show.php/?content=162055/"
license=('GPL')
depends=('gtk-engine-murrine' 'gtk-engines')
source=("git://github.com/redtide/glossyblack-gtk-theme.git")
md5sums=('SKIP')

package() {
  install -d "$pkgdir/usr/share/themes/GlossyBlack"
  cp -r $srcdir/glossyblack-gtk-theme/GlossyBlack "$pkgdir/usr/share/themes"
}
