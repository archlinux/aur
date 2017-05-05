# Maintainer: Ainola

pkgname=gtk-theme-minwaita
pkgver=1.4
pkgrel=1
pkgdesc="A tweaked, more compact version of Adwaita."
arch=(any)
url="https://github.com/godlyranchdressing/Minwaita"
license=('GPL')
source=("Minwaita-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/Minwaita/releases/download/V$pkgver/Minwaita.tar.gz"
        "Minwaita-OSX-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/Minwaita/releases/download/V$pkgver/Minwaita-OSX.tar.gz"
        "Minwaita-Vanilla-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/Minwaita/releases/download/V$pkgver/Minwaita-Vanilla.tar.gz")
sha256sums=('c004d672cd5ee34f3a5e1580b5347005a16f7d623e8fb35e05a784a99ab5b78e'
            '98330a2b634997bf932a6648e29c80e4eee728903aeb37c1d0743e94cf2d5f41'
            '4fb386adbf52cef15b9486ed8927dd6b5a476e7ee63cc3bb012c8f7ea1b5b111')

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
