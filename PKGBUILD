# Maintainer: Valerio Pizzi <pival81@yahoo.com>

pkgname=vivacious-colors-gtk-theme
pkgver=16.04
pkgrel=1
pkgdesc="Vivacious Colors GTK is a brand NEW GTK 3/2 Theme by the RAVEfinity Open Design Team."
arch=('any')
url="http://www.ravefinity.com/p/vivacious-colors-gtk-theme.html"
license=('GPL')
source=('http://download1586.mediafire.com/tm81be6y5jqg/j2nbl7tq9i2q9rx/Vivacious-Colors-GTK-3-18-Theme-v-16-04-1.tar.gz')
md5sums=('8952df4fa7024b3167627ecc3623d59a')

package() {
 rm Vivacious-Colors-GTK-3-18-Theme-v-16-04-1.tar.gz
 mkdir -p "$pkgdir/usr/share/themes"
 cp -r Vivacious* "$pkgdir/usr/share/themes"
}
