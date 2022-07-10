# Maintainer: Munzir Taha <munzirtaha@gmail.com>

pkgname=ttf-amiri
pkgver=0.117
pkgrel=1
pkgdesc="A Classical Arabic Naskh typeface poineered by Amiria/Bulaq Press in Cairo"
arch=('any')
url="http://www.amirifont.org/"
license=('OFL')
source=(https://github.com/khaledhosny/amiri-font/releases/download/$pkgver/amiri-$pkgver.zip)
sha256sums=('9c4e768893e0023a0ad6f488d5c84bd5add6565d3dcadb838ba5b20e75fcc9a7')

package() {
  cd "$srcdir/Amiri-$pkgver"
  install -Dm644 *.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 Documentation-Arabic* NEWS* README* -t "$pkgdir/usr/share/doc/$pkgname/"
}
