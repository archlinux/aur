# Maintainer: Munzir Taha <munzirtaha@gmail.com>

pkgname=ttf-amiri
pkgver=0.114
pkgrel=1
pkgdesc="A Classical Arabic Naskh typeface poineered by Amiria/Bulaq Press in Cairo"
arch=('any')
url="http://www.amirifont.org/"
license=('OFL')
source=(https://github.com/khaledhosny/amiri-font/releases/download/$pkgver/amiri-$pkgver.zip)
sha256sums=('4222d8636b40f4e547828f68da5c60c8a500d061bcab8df17da5a1d944446429')

package() {
  cd "$srcdir/Amiri-$pkgver"
  install -Dm644 *.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  #install -Dm644 {NEWS,README}{,-Arabic} -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 NEWS* README* -t "$pkgdir/usr/share/doc/$pkgname/"
}
