# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=kaniko
pkgver=0.1.0
pkgrel=1
pkgdesc="A tool to build container images from a Dockerfile, inside a container or Kubernetes cluster"
arch=("any")
url="https://github.com/GoogleContainerTools/${pkgname}"
license=("APACHE")
depends=("docker" "google-cloud-sdk")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GoogleContainerTools/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('69d37be27faa0739ceb7e88ed4c1d5f64b2756fba1417df1e53d0dddf1e45385')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/run_in_docker.sh" "${pkgdir}/usr/bin/${pkgname}"
}
