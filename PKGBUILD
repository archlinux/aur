# Maintainer: Jonathan Wright <jon@than.io>

_pkg=tflint
pkgname=${_pkg}-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="A linter for Terraform code"
arch=('x86_64')
url="https://github.com/wata727/${_pkg}"
license=('MIT')
depends=('glibc')
makedepends=('zip')
source=("tflint_linux_amd64-${pkgver}.zip::${url}/releases/download/v${pkgver}/tflint_linux_amd64.zip")
sha512sums=('28aab3ec7bdebbce4c23aaec17bcdb4698f4705e650965da0ca91cd2f24665ad1e6714d7f7f12c5ef96cc41db85eecbdedcf4b3c32e271eaf0b0d95c696a409f')

package() {
  cd ${srcdir}
  install -Dm755 ${_pkg} ${pkgdir}/usr/bin/${_pkg}
}
