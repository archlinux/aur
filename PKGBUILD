pkgname=mangaplace
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI tool to download manga."
arch=('any')
url="https://github.com/uttamkn/mangaplace"
license=('MIT')
source=("${pkgname}::https://github.com/uttamkn/mangaplace/releases/download/v${pkgver}/${pkgname}")
sha256sums=('9c0e0649d3fd55ac638099c3272b3abca4f6b59f1dacb4964b0f3bbf18f52cb6')

package() {
  install -Dm755 "$srcdir/$pkgname" "${pkgdir}/usr/bin/${pkgname}"
}
