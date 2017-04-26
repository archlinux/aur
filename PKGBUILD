# Maintainer: Ainola

pkgname=gtk-theme-minwaita
pkgver=1.2.3
pkgrel=2
pkgdesc="A tweaked, more compact version of Adwaita."
arch=(any)
url="https://github.com/godlyranchdressing/Minwaita"
license=('GPL')
source=("https://github.com/godlyranchdressing/Minwaita/raw/master/Minwaita-Latest.tar.gz")
sha256sums=('c88250255fda4a0224e3a4dd5b427333ef64fa8a63549628110b6de1d7e3df46')

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  cp -r "$srcdir"/Minwaita-Latest/Minwaita "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Latest/Minwaita-Dark "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Latest/Minwaita-Light "$pkgdir/usr/share/themes/"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
