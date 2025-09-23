# Maintainer: Anthony Vitacco <breaker1@pm.me>
pkgname=container-structure-test
pkgver=1.20.0
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
sha256sums=('637d2fc575e293e0105bf57b04f69eae0ea268dbd8dc7637f24896128fe68782')
package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
