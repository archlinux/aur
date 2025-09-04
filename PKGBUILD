# maintainer="uttamkn uttamkn15@gmail.com"

pkgname=mangaplace
pkgver=1.0.2
pkgrel=3
pkgdesc="A CLI tool to download manga."
arch=('x86_64')
url="https://github.com/uttamkn/mangaplace"
license=('MIT')
source=("${pkgname}-${pkgver}.zip::https://github.com/uttamkn/mangaplace/releases/download/v${pkgver}/mangaplace-${pkgver}.zip")
sha256sums=('a6f2b6b6bc84debaf433d6ca8d7fc2127da1ee8f473c122fce1f407c65ee06f2')

package() {
  install -Dm755 "$srcdir/$pkgname" "${pkgdir}/usr/bin/${pkgname}"
}
