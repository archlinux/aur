# Maintainer: Munzir Taha <munzirtaha@gmail.com>

pkgname=ttf-amiri
pkgver=1.003
pkgrel=1
pkgdesc="Amiri (أميري) is a body text Naskh typeface"
arch=('any')
url="http://www.amirifont.org/"
license=('OFL-1.1')
source=(https://github.com/aliftype/amiri/releases/download/$pkgver/Amiri-$pkgver.zip)
sha256sums=('81af0aff7d2086d8af24cea7202f7546130997982534691373485cd96744d05e')

package() {
  cd "$srcdir/Amiri-$pkgver"
  install -Dvm644 *.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dvm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dvm644 *.html *.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
