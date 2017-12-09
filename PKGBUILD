# Maintainer: Bram Swenson <bram@craniumisajar.com>

_pkg=tflint
pkgname=${_pkg}-bin
pkgver=0.5.3
pkgrel=2
pkgdesc="A linter for Terraform code"
arch=('x86_64')
url="https://github.com/wata727/${_pkg}"
license=('MIT')
depends=('glibc')
makedepends=('zip')
source=("${url}/releases/download/v${pkgver}/tflint_linux_amd64.zip")
sha512sums=('2edf8b7861d9fd0efb6453c17f38ff6824bd2da02fbdac488ad97c362d70ac64bbb0c28e6e3280fa34b15212bb1eb4af0c58e6eed724ba2e5c0ceb6c9bd3c0d1')

package() {
  cd ${srcdir}
  install -Dm755 ${_pkg} ${pkgdir}/usr/bin/${_pkg}
}
