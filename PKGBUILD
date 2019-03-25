# Maintainer: Jonathan Wright <jon@than.io>

_pkg=tflint
pkgname=${_pkg}-bin
pkgver=0.7.4
pkgrel=2
pkgdesc="A linter for Terraform code"
arch=('x86_64')
url="https://github.com/wata727/${_pkg}"
license=('MIT')
depends=('glibc')
makedepends=('zip')
source=("tflint_linux_amd64-${pkgver}.zip::${url}/releases/download/v${pkgver}/tflint_linux_amd64.zip")
sha512sums=('c1c6ee62ed98aa20396a4383f131b2ed4cd0f372efce30a75bbb15bdf3c9062885ab0e0ca6734df520f1a68bfca9715e0d1c257ad8793a3e489937c55a155fc2')

package() {
  cd ${srcdir}
  install -Dm755 ${_pkg} ${pkgdir}/usr/bin/${_pkg}
}
