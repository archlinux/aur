# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname="maya-gtk3-theme"
pkgver="0.0.2"
pkgrel="1"
pkgdesc="Numix-like theme with Macbuntu buttons added."
arch=("any")
license=("GPL")
url="http://gnome-look.org/content/show.php/Maya?content=175443"
source=("https://www.dropbox.com/s/v7u5x2nj6fy7uoz/175443-Maya.zip")
md5sums=("4d75d9d492c3b689711a9fb096d34664")


package() {
  mkdir -p "$pkgdir/usr/share/themes/Maya"

  cp -r \
      "$srcdir/gtk-2.0" \
      "$srcdir/gtk-3.0" \
      "$srcdir/index.theme" \
      "$srcdir/metacity-1" \
      "$pkgdir/usr/share/themes:Maya"
}
