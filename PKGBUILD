# Maintainer: Ainola

pkgname=gtk-theme-minwaita
pkgver=1.3
pkgrel=2
pkgdesc="A tweaked, more compact version of Adwaita."
arch=(any)
url="https://github.com/godlyranchdressing/Minwaita"
license=('GPL')
source=("https://github.com/godlyranchdressing/Minwaita/releases/download/V1.3/Minwaita-$pkgver.tar.gz")
sha256sums=('32da8671d08b0a9166bbaa221a2306a693fd93bba2af3988df93f33ae1deff36')

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  cp -r "$srcdir"/Minwaita-Latest/Minwaita "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Latest/Minwaita-Dark "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Latest/Minwaita-Light "$pkgdir/usr/share/themes/"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
