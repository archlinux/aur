# Maintainer: Munzir Taha <munzirtaha@gmail.com>

pkgname=ttf-fustat
pkgver=1.008
pkgrel=2
pkgdesc="Fustat Font-Family"
arch=('any')
url="https://github.com/Kief-Type-Foundry/Fustat"
license=('OFL-1.1')
source=(https://github.com/Kief-Type-Foundry/Fustat/releases/download/v$pkgver/Fustat-v$pkgver.zip)
sha256sums=('b33b92c8c3066a0ece83de425453b7022684db959aa24e0ddc31608bfc32d94e')

package() {
  cd "$srcdir/Fustat-v$pkgver"
  install -Dvm644 fonts/variable/*.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dvm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dvm644 *.html -t "$pkgdir/usr/share/doc/$pkgname/"
}
