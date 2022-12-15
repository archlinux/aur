# Maintainer: Anthony Vitacco <breaker1@pm.me>
pkgname=container-structure-test
pkgver=1.14.0
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
sha256sums=('f778b05f0d7763f17912fc8dd75da630c0f1f9de293fbb63e96dcb19f0587ac0')
package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
