# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="hope-gtk3-theme"
pkgver="1.2"
pkgrel="1"
pkgdesc="A light-and-dark, and dark-and-darker set of themes."
arch=("any")
license=("GPL")
url="http://grvrulz.deviantart.com/art/Hope-gtk3-206207315"
source=("https://www.dropbox.com/s/my1hnl0r8vwl9ej/hope_gtk3_by_grvrulz-d3erqkz.7z")
md5sums=("b8736d21fc86a8f291fb1c547e38f8fb")

package() {
  mkdir -p "$pkgdir/usr/share/themes"

  cp -r \
      "$srcdir/Hope" \
      "$srcdir/Hope-DT" \
      "$pkgdir/usr/share/themes"
}
