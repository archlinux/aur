# Maintainer: Anthony Vitacco <breaker1@pm.me>
pkgname=container-structure-test
pkgver=1.9.1
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
sha256sums=('9ddc0791491dc8139af5af4d894e48db4eeaca4b2cb9196293efd615bdb79122')
package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
