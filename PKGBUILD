# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=skaffold
pkgver=0.13.0
pkgrel=1
pkgdesc="A command line tool that facilitates continuous development for Kubernetes applications"
arch=("x86_64")
url="https://github.com/GoogleContainerTools/${pkgname}"
license=("APACHE")
depends=("docker" "kubectl-bin")
optdepends=("google-cloud-sdk: To use GKE" 
            "minikube: To use Minikube")
source=("${pkgname}-${pkgver}::https://storage.googleapis.com/${pkgname}/releases/v${pkgver}/${pkgname}-linux-amd64")
sha256sums=("162469255cfb03f6daaa93d033ba46b668b59cece489eaea415e53ed0654982e")

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
