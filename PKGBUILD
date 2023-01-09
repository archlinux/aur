# Maintainer: Jonathan Wright <jon@than.io>

_pkg=tflint
pkgname=${_pkg}-bin
pkgver=0.44.0
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
sha512sums=('71beb3682eafa2bef2ad3128d4a8333e63c40c98ea787abae220e65e0508cc4c5743f45d9a63202ab59b84ec12f8ac0376a6705899d9211a7b6fea2047de92ad')

package() {
  cd ${srcdir}
  install -Dm755 ${_pkg} ${pkgdir}/usr/bin/${_pkg}
}
