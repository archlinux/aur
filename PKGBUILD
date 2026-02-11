# Maintainer: Anthony Vitacco <breaker1@pm.me>
pkgname=container-structure-test
pkgver=1.22.1
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
sha256sums=('fa35e89512a8978585f76cf41397956d2e3a30c62c2ad3fb857b1597074d14ca')
package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
