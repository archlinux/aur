# Maintainer: Ainola

pkgname=gtk-theme-minwaita
pkgver=1.2.2
pkgrel=2
pkgdesc="A tweaked, more compact version of Adwaita."
arch=(any)
url="https://github.com/godlyranchdressing/Minwaita"
license=('GPL')
depends=('')
source=("https://github.com/godlyranchdressing/Minwaita/raw/master/Minwaita-Latest.tar.gz")
sha256sums=('9e80254eabdaf2b5ebefd0c171c27f6a06ee91e8902fe1aaf73f4ead8a04fc91')

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  cp -r "$srcdir"/Minwaita-Latest/Minwaita "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Latest/Minwaita-Dark "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Latest/Minwaita-Light "$pkgdir/usr/share/themes/"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
