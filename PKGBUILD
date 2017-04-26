# Maintainer: Ainola

pkgname=gtk-theme-united-gnome
pkgver=1.8.2
pkgrel=1
pkgdesc="Based on a Ubuntu 18.04 design concept Flat-Plat as a base."
arch=(any)
url="https://github.com/godlyranchdressing/United-GNOME"
license=('GPL2')
source=("https://github.com/godlyranchdressing/United-GNOME/raw/master/United-Latest.tar.gz")
md5sums=('70409be8cea8ff447c8aba9d5257ebdb')

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  find "$srcdir" -iname readme.md -exec rm {} \;
  cp -r "$srcdir"/United-Latest/* "$pkgdir/usr/share/themes/"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
