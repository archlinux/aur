# Maintainer: Bram Swenson <bram@craniumisajar.com>

_pkg=tflint
pkgname=${_pkg}-bin
pkgver=0.5.4
pkgrel=2
pkgdesc="A linter for Terraform code"
arch=('x86_64')
url="https://github.com/wata727/${_pkg}"
license=('MIT')
depends=('glibc')
makedepends=('zip')
source=("${url}/releases/download/v${pkgver}/tflint_linux_amd64.zip")
sha512sums=('a32dafe9f4a8b474407755e54229c53d4551556a478ec26d1e7ffb65805dcae55104e02136201090268c8f9336454008cef439f55850c5ea8313ae667f0d78a9')

package() {
  cd ${srcdir}
  install -Dm755 ${_pkg} ${pkgdir}/usr/bin/${_pkg}
}
