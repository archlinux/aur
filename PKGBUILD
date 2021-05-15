# Maintainer: erdii <me at erdii dot engineering>
pkgname=import
pkgver=e8314f6c6136a6be6bb5cbb2a4a83d5a1ec1efa9
pkgrel=4
pkgdesc="import is a simple and fast module system for Bash and other Unix shells."
arch=('any')
url="https://github.com/importpw/import"
license=('MIT')
depends=()

source=("${pkgname}-${pkgver}.sh::https://raw.githubusercontent.com/importpw/import/${pkgver}/${pkgname}.sh")

sha256sums=('fbf1ef807c383aa3fb5fdfb99a92b145b651d33f217cc5bbb52e708f6df6f395')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
