# maintainer="uttamkn uttamkn15@gmail.com"

pkgname=mangaplace
pkgver=0.3.1
pkgrel=3
pkgdesc="A CLI tool to download manga."
arch=('x86_64')
url="https://github.com/uttamkn/mangaplace"
license=('MIT')
source=("${pkgname}-${pkgver}.zip::https://github.com/uttamkn/mangaplace/releases/download/v${pkgver}/mangaplace-${pkgver}.zip")
sha256sums=('4e49c4bbca8809810763227b9809a256cdb0907b3fc981316145d78d2cbb4fcf')

package() {
  install -Dm755 "$srcdir/$pkgname" "${pkgdir}/usr/bin/${pkgname}"
}
