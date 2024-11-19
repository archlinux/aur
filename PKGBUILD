# Maintainer: Munzir Taha <munzirtaha@gmail.com>

pkgname=ttf-amiri
pkgver=1.001
pkgrel=1
pkgdesc="Amiri (أميري) is a body text Naskh typeface"
arch=('any')
url="http://www.amirifont.org/"
license=('OFL-1.1')
source=(https://github.com/aliftype/amiri/releases/download/$pkgver/Amiri-$pkgver.zip)
sha256sums=('cae999a9fc5638cb69cf0812e8bca1437ef1ebbf094f8b3c5b3f0a3ea2ef8c3a')

package() {
  cd "$srcdir/Amiri-$pkgver"
  install -Dvm644 *.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dvm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dvm644 *.html *.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
