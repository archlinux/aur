# Maintainer: Bram Swenson <bram@craniumisajar.com>

_pkg=tflint
pkgname=${_pkg}-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="A linter for Terraform code"
arch=('x86_64')
url="https://github.com/wata727/${_pkg}"
license=('MIT')
depends=('glibc')
makedepends=('zip')
source=("${url}/releases/download/v${_pkg}/tflint_linux_amd64.zip")
sha512sums=('55ab2b43203a56d5d41db518ce215c98e0727c93953897c87651007b183fb1c8b87e4b6c305eacf5d9401e63336e3d2f00f4f78b5d7ddbb186326091c12cfd65')

package() {
  cd ${srcdir}
  install -Dm755 ${_pkg} ${pkgdir}/usr/bin/${_pkg}
}
