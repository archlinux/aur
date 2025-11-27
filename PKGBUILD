# Maintainer: Munzir Taha <munzirtaha@gmail.com>

pkgname=ttf-fustat
pkgver=1.011
pkgrel=1
pkgdesc="Fustat Font Family"
arch=('any')
url="https://github.com/Kief-Type-Foundry/Fustat"
license=('OFL-1.1')
source=(https://github.com/Kief-Type-Foundry/Fustat/releases/download/v$pkgver/Fustat-v$pkgver.zip)
sha256sums=('7227fe449e68bb83ca76baf07f3b31256369851ae103e8fcb8b29b931a81686d')

package() {
  cd "$srcdir/Fustat-v$pkgver"
  install -Dvm644 fonts/variable/*.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dvm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dvm644 *.html -t "$pkgdir/usr/share/doc/$pkgname/"
}
