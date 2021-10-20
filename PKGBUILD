# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=ttf-bbcreith
pkgver=2.300
pkgrel=1
pkgdesc="BBC Reith is the official font of BBC"
arch=('any')
url="https://www.bbc.co.uk/branding/reith-font"
license=('custom')
source=("https://bbc.com/branding/documents/bbcreith_v$pkgver.zip")
sha256sums=('SKIP')

package() {
  cd "$srcdir/BBCReithSans_V$pkgver/"
  install -Dt "$pkgdir/usr/share/fonts/TTF" -m644 Desktop/*.ttf

  cd "$srcdir/BBCReithSerif_V$pkgver/"
  install -Dt "$pkgdir/usr/share/fonts/TTF" -m644 Desktop/*.ttf
}
