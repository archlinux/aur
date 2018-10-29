# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=skaffold
pkgver=0.17.0
pkgrel=1
pkgdesc="A command line tool that facilitates continuous development for Kubernetes applications"
arch=("x86_64")
url="https://github.com/GoogleContainerTools/${pkgname}"
license=("APACHE")
depends=("docker" "kubectl-bin")
optdepends=("google-cloud-sdk: To use GKE" 
            "minikube: To use Minikube")
source=("${pkgname}-${pkgver}::https://storage.googleapis.com/${pkgname}/releases/v${pkgver}/${pkgname}-linux-amd64")
sha256sums=("1ea9dac8683e592b30936392792f8d531e67acf248edb966dac51ef6e949b82f")

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
