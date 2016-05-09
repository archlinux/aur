# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="candra-themes-3.20-1"
pkgver="05082016"
pkgrel="1"
pkgdesc="A light-and-dark, and dark-and-darker set of themes."
arch=("any")
url="http://www.deviantart.com/art/Candra-Themes-3-20-1-05082016-607878370"
source=("https://www.dropbox.com/s/x16uuh6kc2cxx2l/candra_themes_3_20_1_${pkgver}_by_killhellokitty-da1wxya.zip")
md5sums=("5007396e1de4e86e99164ae4ce62695b")

package() {
  mkdir -p "$pkgdir/usr/share/themes"

  cp -r \
      "$srcdir/Candra-Theme-3.20" \
      "$srcdir/Candra-Theme-3.20-Dark" \
      "$pkgdir/usr/share/themes"
}
