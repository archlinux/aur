# Maintainer: RedTide
pkgname=gtk-theme-glossyblack
pkgver=0.2.0
pkgrel=2
pkgdesc="GTK2, GTK3, Metacity, XFCE4 theme."
arch=('any')
url="https://github.com/redtide/$pkgname"
license=('GPL')
depends=('gtk-engine-murrine' 'gtk-engines')
source=("git://github.com/redtide/$pkgname.git")
md5sums=('SKIP')

package() {
  install -d "$pkgdir/usr/share/themes/GlossyBlack"
  cp -r $srcdir/$pkgname/GlossyBlack "$pkgdir/usr/share/themes"
}
