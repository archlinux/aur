# Maintainer: Jonathan Wright <jon@than.io>

_pkg=tflint
pkgver=0.12.0
pkgrel=1
pkgdesc="A linter for Terraform code"
arch=('x86_64')
url="https://github.com/wata727/${_pkg}"
license=('MIT')
depends=('glibc')
makedepends=('zip')
source=("tflint_linux_amd64-${pkgver}.zip::${url}/releases/download/v${pkgver}/tflint_linux_amd64.zip")
sha512sums=('feb5a2b8124ec7b4e146378d595d86dbca1cc4c4be7946d22263b48026e64c2ff54799dfa285517a7b51c96189eba5778efe138c5e2a7be7c2da0910835c83ec')

package() {
  cd ${srcdir}
  install -Dm755 ${_pkg} ${pkgdir}/usr/bin/${_pkg}
}
