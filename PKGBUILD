# maintainer="uttamkn uttamkn15@gmail.com"

pkgname=mangaplace
pkgver=1.0.1
pkgrel=3
pkgdesc="A CLI tool to download manga."
arch=('x86_64')
url="https://github.com/uttamkn/mangaplace"
license=('MIT')
source=("${pkgname}-${pkgver}.zip::https://github.com/uttamkn/mangaplace/releases/download/v${pkgver}/mangaplace-${pkgver}.zip")
sha256sums=('e04758576fec0420a96aadb471e28893d8ec416bd8a066feaeb58555e32c6d16')

package() {
  install -Dm755 "$srcdir/$pkgname" "${pkgdir}/usr/bin/${pkgname}"
}
