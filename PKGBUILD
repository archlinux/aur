# Maintainer: Munzir Taha <munzirtaha@gmail.com>

pkgname=ttf-amiri
pkgver=1.002
pkgrel=1
pkgdesc="Amiri (أميري) is a body text Naskh typeface"
arch=('any')
url="http://www.amirifont.org/"
license=('OFL-1.1')
source=(https://github.com/aliftype/amiri/releases/download/$pkgver/Amiri-$pkgver.zip)
sha256sums=('e39bea40fb64d77cb511a686d2506005b2e39a85166a4ebcf858111d416c14a5')

package() {
  cd "$srcdir/Amiri-$pkgver"
  install -Dvm644 *.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dvm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dvm644 *.html *.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
