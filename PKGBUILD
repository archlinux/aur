# Maintainer: David Birks <david@tellus.space>

pkgname=kaniko
pkgver=0.9.0
pkgrel=1
pkgdesc="A tool to build container images from a Dockerfile, inside a container or Kubernetes cluster"
arch=("any")
url="https://github.com/GoogleContainerTools/${pkgname}"
license=("APACHE")
depends=("docker" "google-cloud-sdk")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GoogleContainerTools/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f6138c7eb1f1e1418a0db8aaa890bc839dde3327f5f3a31546f34ca562022805')

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/run_in_docker.sh" "${pkgdir}/usr/bin/${pkgname}"
}
