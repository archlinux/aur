# Maintainer: Munzir Taha <munzirtaha@gmail.com>
pkgname=ttf-amiri
pkgver=0.113
pkgrel=1
pkgdesc="A Classical Arabic typeface in Naskh style poineered by Amiria/Bulaq Press in Cairo"
arch=('any')
url="http://www.amirifont.org/"
license=('custom:OFL')
source=(https://github.com/khaledhosny/amiri-font/releases/download/$pkgver/amiri-$pkgver.zip)
sha256sums=('0e43960c075ca372cffe563d00b72d13aa775237868fea4f8c6a6fe03818a68d')
package() {
  cd "$srcdir/Amiri-$pkgver"
  install -Dm644 *.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt"
  install -Dm644 *.pdf {NEWS,README}{,-Arabic} -t "$pkgdir/usr/share/doc/$pkgname/"
}
