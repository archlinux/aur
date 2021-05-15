# Maintainer: erdii <me at erdii dot engineering>
pkgname=import
commit="e8314f6c6136a6be6bb5cbb2a4a83d5a1ec1efa9"
pkgver=10
pkgrel=1
pkgdesc="import is a simple and fast module system for Bash and other Unix shells."
arch=('any')
url="https://github.com/importpw/import"
license=('MIT')
depends=()

source=("${pkgname}-${commit}.sh::https://raw.githubusercontent.com/importpw/import/${commit}/${pkgname}.sh")

sha256sums=('fbf1ef807c383aa3fb5fdfb99a92b145b651d33f217cc5bbb52e708f6df6f395')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${commit}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
