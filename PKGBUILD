# Maintainer: Munzir Taha <munzirtaha@gmail.com>

pkgname=ttf-amiri
pkgver=1.000
pkgrel=2
pkgdesc="A Classical Arabic Naskh typeface pioneered by Amiria/Bulaq Press in Cairo"
arch=('any')
url="http://www.amirifont.org/"
license=('OFL')
source=(https://github.com/khaledhosny/amiri-font/releases/download/$pkgver/amiri-$pkgver.zip)
sha256sums=('926fe1bd7dfde8e55178281f645258bfced6420c951c6f2fd532fd21691bca30')

package() {
  cd "$srcdir/Amiri-$pkgver"
  install -Dm644 *.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 *.html *.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
