# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=kaniko
pkgver=0.0
pkgrel=1
pkgdesc="A tool to build container images from a Dockerfile, inside a container or Kubernetes cluster"
arch=("any")
url="https://github.com/GoogleContainerTools/${pkgname}"
license=("APACHE")
depends=("docker" "google-cloud-sdk")
source=("${pkgname}-${pkgver}.sh::https://raw.githubusercontent.com/GoogleContainerTools/${pkgname}/master/run_in_docker.sh")
sha256sums=("e48a0c9c57bc9d38c3cb774ad4f25d55bee611c73d6b596e532b6e34c270d099")

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
