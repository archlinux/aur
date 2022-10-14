# Maintainer: Munzir Taha <munzirtaha@gmail.com>

pkgname=ttf-amiri
pkgver=0.900
pkgrel=1
pkgdesc="A Classical Arabic Naskh typeface poineered by Amiria/Bulaq Press in Cairo"
arch=('any')
url="http://www.amirifont.org/"
license=('OFL')
source=(https://github.com/khaledhosny/amiri-font/releases/download/$pkgver/amiri-$pkgver.zip)
sha256sums=('ab5dbcf2464ef929e8bd0a25533686a305c921731456173d2e19023281bfe361')

package() {
  cd "$srcdir/Amiri-$pkgver"
  install -Dm644 *.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 Documentation-Arabic* NEWS* README* -t "$pkgdir/usr/share/doc/$pkgname/"
}
