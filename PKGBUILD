# maintainer="uttamkn uttamkn15@gmail.com"

pkgname=mangaplace
pkgver=0.3.1
pkgrel=3
pkgdesc="A CLI tool to download manga."
arch=('x86_64')
url="https://github.com/uttamkn/mangaplace"
license=('MIT')
source=("${pkgname}-${pkgver}.zip::https://github.com/uttamkn/mangaplace/releases/download/v${pkgver}/mangaplace-${pkgver}.zip")
sha256sums=('acbee05b211c05051bc8310037cb0ccc536d975c7a4250afa31a4c05b35cc10c')

package() {
  install -Dm755 "$srcdir/$pkgname" "${pkgdir}/usr/bin/${pkgname}"
}
