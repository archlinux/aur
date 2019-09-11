# Maintainer: Jonathan Wright <jon@than.io>

_pkg=tflint
pkgname=${_pkg}-bin
pkgver=0.11.1
pkgrel=1
pkgdesc="A linter for Terraform code"
arch=('x86_64')
url="https://github.com/wata727/${_pkg}"
license=('MIT')
depends=('glibc')
makedepends=('zip')
source=("tflint_linux_amd64-${pkgver}.zip::${url}/releases/download/v${pkgver}/tflint_linux_amd64.zip")
sha512sums=('a476fecb7e09742d274b1c55fe02d3accb4482c35beaaf7e73fa02025b2a76c5199805f778969c2cbdda786c68a71b3d455123c323e6d2d34bf082b333ff10df')

package() {
  cd ${srcdir}
  install -Dm755 ${_pkg} ${pkgdir}/usr/bin/${_pkg}
}
