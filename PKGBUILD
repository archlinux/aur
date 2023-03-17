# Maintainer: Anthony Vitacco <breaker1@pm.me>
pkgname=container-structure-test
pkgver=1.15.0
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
source=("${pkgname}::https://storage.googleapis.com/${pkgname}/v${pkgver}/${pkgname}-linux-amd64")
sha256sums=('e85893d05eb0716102aafcb68eba417341a92e549b126c9240f2b91d7ce83d5a')
package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
