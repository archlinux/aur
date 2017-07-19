# Maintainer: Ainola

pkgname=gtk-theme-minwaita
pkgver=1.6
pkgrel=1
pkgdesc="A tweaked, more compact version of Adwaita."
arch=(any)
url="https://github.com/godlyranchdressing/Minwaita"
license=('GPL')
source=("Minwaita-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/Minwaita/releases/download/V$pkgver/Minwaita.tar.gz"
        "Minwaita-OSX-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/Minwaita/releases/download/V$pkgver/Minwaita-OSX.tar.gz"
        "Minwaita-Vanilla-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/Minwaita/releases/download/V$pkgver/Minwaita-Vanilla.tar.gz")
sha256sums=('320335776b3da270b77ee6e0c395c1d61faadc509f42df7621d43be7256da1fc'
            '406f4fb92ba5415e5c648ff722f5ea2cfed581e107b43b83b314dde6367cbd40'
            '3dc24e9749d1cd043b8c7e29240243fe35579abe356a3aed43a81014cc46f3e3')

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  cp -r "$srcdir"/Minwaita "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Dark "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-OSX "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-OSX-Dark "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Vanilla "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Vanilla-Dark "$pkgdir/usr/share/themes/"
  cp -r "$srcdir"/Minwaita-Light-Shell "$pkgdir/usr/share/themes/"
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
