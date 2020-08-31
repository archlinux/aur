# Maintainer: erdii <me at erdii dot engineering>
pkgname=import
pkgver=8c0f022c6fd5d5a1629ba1f3a86901878d4d4f52
pkgrel=3
pkgdesc="import is a simple and fast module system for Bash and other Unix shells."
arch=('any')
url="https://github.com/importpw/import"
license=('MIT')
depends=()

source=("https://raw.githubusercontent.com/importpw/import/${pkgver}/${pkgname}.sh")

sha256sums=('4e6b437e63c5516668ce571498d0fe2fcc13d991a31c7376cc4da1fe6962c1c7')

package() {
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/local/bin/${pkgname}"
}
