# maintainer="uttamkn uttamkn15@gmail.com"

pkgname=mangaplace
pkgver=0.3.1
pkgrel=3
pkgdesc="A CLI tool to download manga."
arch=('x86_64')
url="https://github.com/uttamkn/mangaplace"
license=('MIT')
source=("${pkgname}-${pkgver}.zip::https://github.com/uttamkn/mangaplace/releases/download/v${pkgver}/mangaplace-${pkgver}.zip")
sha256sums=('840a066b5dd38ed9868fe1b5df6fd21a88233fc4025c2bcf0e727884a09f0eed')

package() {
  install -Dm755 "$srcdir/$pkgname" "${pkgdir}/usr/bin/${pkgname}"
}
