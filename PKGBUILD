pkgname=ttf-averia-serif-libre
pkgver=1.0
pkgrel=1
pkgdesc="Averia Serif Libre fonts, typeface a bit gentle from Averia Serif"
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 "$srcdir/$pkgname/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
}
