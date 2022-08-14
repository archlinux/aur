# Maintainer: Nicolas Guillaumin <nicolas plus archlinux at guillaumin dot me>

pkgname=audiowide-font
pkgver=1.0
pkgrel=2
pkgdesc="Audiowide is a sans serif, technology styled, typeface composed of soft corner tubular forms. With vague nods to letter styles like that of 
Handel Gothic and the Converse logo."
url="http://www.astigmatic.com"
arch=(any)
license=(Public domain, GPL, OFL)
#makedepends=('unzip: Unzip the source font file')
source=("https://www.1001fonts.com/download/audiowide.zip")
sha512sums=('e566e00b9a1d0f789c394548da2f2a1831d1969560baca03613cd56a2ad14d6184ce4c11ae520b0a830910b2bafe101e9a7c249cfce9f2a8aeedde9a3818c23a')

package() {
#  unzip audiowide.zip
  install -d "$pkgdir/usr/share/fonts/${pkgname%-font}"
  install -t "$pkgdir/usr/share/fonts/${pkgname%-font}" -m644 Audiowide-Regular.ttf
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
