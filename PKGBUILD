# Maintainer: Jonathan Wright <jon@than.io>

_pkg=tflint
pkgname=${_pkg}-bin
pkgver=0.47.0
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
sha512sums=('e9d88591ae661e1973b8908a16b7dcf2f4389470734bf722c88f35c16383a6c99bfb00cb810c122a0b6c3f3814fb7cebc87402eff7ff1ed9b298ac52680c9abb')

package() {
  cd ${srcdir}
  install -Dm755 ${_pkg} ${pkgdir}/usr/bin/${_pkg}
}
