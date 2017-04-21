# Maintainer: Ainola

pkgname=gtk-theme-minwaita
pkgver=1.2.1
pkgrel=1
pkgdesc="A tweaked, more compact version of Adwaita."
arch=(any)
url="https://github.com/godlyranchdressing/Minwaita"
license=('GPL')
depends=('')
source=("https://dl.opendesktop.org/api/files/download/id/1492633777/Minwaita%20V$pkgver.tar.gz")
md5sums=('3979875691c89164d2fcd0063f11bbe8')

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  cp -r "$srcdir"/Minwaita "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Dark "$pkgdir/usr/share/themes/"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
