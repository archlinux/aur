# Maintainer: Jonathan Wright <jon@than.io>

_pkg=tflint
pkgname=${_pkg}-bin
pkgver=0.19.1
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
sha512sums=('0b371d6bb706c5e3dcf685bcd2f98f56c50aeba95e9b6447e0cd7fac96aa8eeddad4c24ace6d055e6ca243296f019f072682a848ba4d78631b5b7e1ee9b34cc1')

package() {
  cd ${srcdir}
  install -Dm755 ${_pkg} ${pkgdir}/usr/bin/${_pkg}
}
