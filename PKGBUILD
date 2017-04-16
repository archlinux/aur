# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname='chrome-window-title-bar-xfwm-theme'
pkgver=2.0
pkgrel=1
pkgdesc='For those of you who would like the chrome-os window buttons'
arch=('any')
url='https://www.xfce-look.org/p/1165642'
license=('GPL')
source=(
  "https://dl.opendesktop.org/api/files/download/id/1482943695/ChrVariants-$pkgver.tar.gz"
  'https://dl.opendesktop.org/api/files/download/id/1482087522/ChrButtons.tar.gz'
)
sha256sums=(
  'fe24a4605e4ad46c2aef540ddbd36d7ee68fd7555cbdd9db29c59fb4ab53e761'
  'b2117d062b6b1b85b33d2b18d6c0111fe0d66401ecde3816f365820108198b2c'
)

package() {
  mkdir -p "$pkgdir/usr/share/themes"

  cp -r \
    "$srcdir/ChrVariants-$pkgver"/* \
    "$srcdir/ChrButtons"/* \
    "$pkgdir/usr/share/themes"
}
