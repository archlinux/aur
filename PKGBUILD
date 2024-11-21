# maintainer="uttamkn uttamkn15@gmail.com"

pkgname=mangaplace
pkgver=0.3.0
pkgrel=3
pkgdesc="A CLI tool to download manga."
arch=('x86_64')
url="https://github.com/uttamkn/mangaplace"
license=('MIT')
source=("${pkgname}::https://github.com/uttamkn/mangaplace/releases/download/v${pkgver}/${pkgname}")
sha256sums=('4d42ef3dcfc9e91f2ff38041558bed2772e0b0508f0746f7379f561b31e8c3da')

package() {
  install -Dm755 "$srcdir/$pkgname" "${pkgdir}/usr/bin/${pkgname}"
}
