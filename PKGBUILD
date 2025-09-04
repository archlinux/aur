# maintainer="uttamkn uttamkn15@gmail.com"

pkgname=mangaplace
pkgver=1.0.0
pkgrel=3
pkgdesc="A CLI tool to download manga."
arch=('x86_64')
url="https://github.com/uttamkn/mangaplace"
license=('MIT')
source=("${pkgname}-${pkgver}.zip::https://github.com/uttamkn/mangaplace/releases/download/v${pkgver}/mangaplace-${pkgver}.zip")
sha256sums=('dc5cc8978034af93556918d208db5b1aa465b1331bbd352e467d4258bcb9d8f8')

package() {
  install -Dm755 "$srcdir/$pkgname" "${pkgdir}/usr/bin/${pkgname}"
}
