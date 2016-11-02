# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=gtk-theme-gray-simple
pkgver=1.0
pkgrel=1
pkgdesc="Flat, animate and gray theme gtk18+ by Mephist Helu."
arch=("any")
license=("GPL")
url="https://www.gnome-look.org/p/1160188"
source=("https://dl.opendesktop.org/api/files/download/id/1478030463/Gray-Simple_gtk18+.zip")
sha1sums=("b71d3a188c50b5bbe73c7ebdb39a8e3896b4a54a")

package() {
  mkdir -p "$pkgdir/usr/share/themes"
  cp -r "$srcdir/Gray-Simple" "$pkgdir/usr/share/themes/Gray-Simple"
  chmod -x "$pkgdir/usr/share/themes/Gray-Simple/index.theme"
}
