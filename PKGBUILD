# Maintainer: Munzir Taha <munzirtaha@gmail.com>

pkgname=ttf-fustat
pkgver=1.010
pkgrel=1
pkgdesc="Fustat Font Family"
arch=('any')
url="https://github.com/Kief-Type-Foundry/Fustat"
license=('OFL-1.1')
source=(https://github.com/Kief-Type-Foundry/Fustat/releases/download/v$pkgver/Fustat-v$pkgver.zip)
sha256sums=('f2b2d89a7851fc4ef4377657a20cc60d32ff8c4bc587632a7e9620cebd2cbcb3')

package() {
  cd "$srcdir/Fustat-v$pkgver"
  install -Dvm644 fonts/variable/*.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dvm644 OFL.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dvm644 *.html -t "$pkgdir/usr/share/doc/$pkgname/"
}
