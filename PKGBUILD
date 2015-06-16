# Contributor: Esclapion <esclapion@gmail.com>

pkgname=azenis-green-icon-theme
pkgver=1
pkgrel=2
pkgdesc="Azenis green icon theme"
arch=('any')
license=('GPL')
url=('http://gnome-look.org/content/show.php/Azenis+Icons+Green?content=126630')
source=('http://esclapion.free.fr/AUR/AzenisIconsGreen_1-2.tar.gz')
md5sums=('313ed5afbadeafbe87ef117475c02192')

package() {
  mkdir -p "$pkgdir/usr/share/icons/Azenis-Green"

  cp -r "$srcdir/AzenisIconsGreen/"{scalable,index.theme} "$pkgdir/usr/share/icons/Azenis-Green/"
  chmod -R 755 "$pkgdir/usr"

  # icon size bugfix
  sed -i 's/devices,,/devices,/' "$pkgdir/usr/share/icons/Azenis-Green/index.theme"
}
