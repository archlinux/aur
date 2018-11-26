# Maintainer: Bram Swenson <bram@craniumisajar.com>

_pkg=tflint
pkgname=${_pkg}-bin
pkgver=0.7.2
pkgrel=1
pkgdesc="A linter for Terraform code"
arch=('x86_64')
url="https://github.com/wata727/${_pkg}"
license=('MIT')
depends=('glibc')
makedepends=('zip')
source=("tflint_linux_amd64-${pkgver}.zip::${url}/releases/download/v${pkgver}/tflint_linux_amd64.zip")
sha512sums=('3a82659af82bab33809ead260579a2fbc866192c0c479f1d758d595d02552781881e1bbbae5edbc317455dc43141c0202ff01d168920a997b77944058b07ed64')

package() {
  cd ${srcdir}
  install -Dm755 ${_pkg} ${pkgdir}/usr/bin/${_pkg}
}
