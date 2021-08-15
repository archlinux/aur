# Maintainer: Jonathan Wright <jon@than.io>

_pkg=tflint
pkgname=${_pkg}-bin
pkgver=0.31.0
pkgrel=1
pkgdesc="A linter for Terraform code"
arch=('x86_64')
url="https://github.com/terraform-linters/${_pkg}"
license=('MIT')
depends=('glibc')
makedepends=('zip')
conflicts=("${_pkg}")
provides=("${_pkg}")
source=("tflint_linux_amd64-${pkgver}.zip::${url}/releases/download/v${pkgver}/tflint_linux_amd64.zip")
sha512sums=('f04b278c83c0cd08182751dc0b4e2bc004036b05f8a6b87ecd00c582ebe901daf46154484bf07e12df6848fe3f9b717d4a9f403db54cbca077293c2f148e6b0f')

package() {
  cd ${srcdir}
  install -Dm755 ${_pkg} ${pkgdir}/usr/bin/${_pkg}
}
