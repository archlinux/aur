# Maintainer: Bram Swenson <bram@craniumisajar.com>

_pkg=tflint
pkgname=${_pkg}-bin
pkgver=0.7.0
pkgrel=2
pkgdesc="A linter for Terraform code"
arch=('x86_64')
url="https://github.com/wata727/${_pkg}"
license=('MIT')
depends=('glibc')
makedepends=('zip')
source=("tflint_linux_amd64-${pkgver}.zip::${url}/releases/download/v${pkgver}/tflint_linux_amd64.zip")
sha512sums=('024b25e3f65d3cc3e18ec77b4c08c7c518ce555b6efe8e365bf112d7c7ad9447a84f2878a44d05f9c234cacbc23a428f7b1d283b7764004727b3f0f6b325d015')

package() {
  cd ${srcdir}
  install -Dm755 ${_pkg} ${pkgdir}/usr/bin/${_pkg}
}
