# Maintainer: Anthony Vitacco <breaker1@pm.me>
pkgname=container-structure-test
pkgver=1.21.1
pkgrel=1
pkgdesc="Validate the structure of your container images"
arch=('x86_64')
url="https://github.com/GoogleContainerTools/container-structure-test"
license=('Apache')
depends=()
makedepends=(
  'go'
)
optdepends=('docker: run tests with the docker driver')
source=("${pkgname}::https://github.com/GoogleContainerTools/container-structure-test/releases/download/v${pkgver}/${pkgname}-linux-amd64")
sha256sums=('cc4a703324b62dd8ada6aed6e4cc51fb2af10e36f8205644ec811e4bcf204dd6')
package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
