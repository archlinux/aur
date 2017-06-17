# Maintainer: Ainola

pkgname=gtk-theme-minwaita
pkgver=1.5
pkgrel=1
pkgdesc="A tweaked, more compact version of Adwaita."
arch=(any)
url="https://github.com/godlyranchdressing/Minwaita"
license=('GPL')
source=("Minwaita-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/Minwaita/releases/download/V$pkgver/Minwaita.tar.gz"
        "Minwaita-OSX-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/Minwaita/releases/download/V$pkgver/Minwaita-OSX.tar.gz"
        "Minwaita-Vanilla-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/Minwaita/releases/download/V$pkgver/Minwaita-Vanilla.tar.gz")
sha256sums=('0d9beb9653dbc0435b8123e26640e3c694361a366084e64475ec1324fd8d08af'
            '914227f5c01f201281bde97262dad9c91e7157fce9d6bd8109772eb4c0e8fb09'
            '0d23985e0e566bc679d8d11d24f16cdd2d46f45c5ff287c00086a51b6fa61af6')

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  cp -r "$srcdir"/Minwaita "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-OSX "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-OSX-Dark "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Vanilla "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Vanilla-Dark "$pkgdir/usr/share/themes/"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
