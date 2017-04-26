# Maintainer: Ainola

pkgname=gtk-theme-minwaita
pkgver=1.2.2
pkgrel=1
pkgdesc="A tweaked, more compact version of Adwaita."
arch=(any)
url="https://github.com/godlyranchdressing/Minwaita"
license=('GPL')
depends=('')
source=("https://github.com/godlyranchdressing/Minwaita/raw/master/Minwaita-Latest.tar.gz")
sh256sums=('3979875691c89164d2fcd0063f11bbe8')

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  cp -r "$srcdir"/Minwaita-Latest/Minwaita "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Latest/Minwaita-Dark "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Latest/Minwaita-Light "$pkgdir/usr/share/themes/"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
md5sums=('80a3a34929f5ad50b942eb80d7a52b25')
