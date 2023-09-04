# Maintainer: Jonathan Wright <jon@than.io>

_pkg=tflint
pkgname=${_pkg}-bin
pkgver=0.48.0
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
sha512sums=('76e2446f94b28b3e1ac9b248ae25f6dd9db2280e00ffd32c51d114dfc308c8ee6ab43f61f56277d93e11314a8b8fe812632fe9f67de494dd43cad66ba9324905')

package() {
  cd ${srcdir}
  install -Dm755 ${_pkg} ${pkgdir}/usr/bin/${_pkg}
}
