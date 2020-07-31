# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=kaniko
pkgver=0.24.0
pkgrel=1
pkgdesc="A tool to build container images from a Dockerfile, inside a container or Kubernetes cluster"
arch=("any")
url="https://github.com/GoogleContainerTools/${pkgname}"
license=("APACHE")
depends=("docker" "google-cloud-sdk")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GoogleContainerTools/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("e79a6184f21331204d9438e2e0d4bd34ad86c70f7376579502f92483081c89c6")

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/run_in_docker.sh" "${pkgdir}/usr/bin/${pkgname}"
}
