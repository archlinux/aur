# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=skaffold
pkgver=0.4.0
pkgrel=1
pkgdesc="A command line tool that facilitates continuous development for Kubernetes applications"
arch=("x86_64")
url="https://github.com/GoogleContainerTools/${pkgname}"
license=("APACHE")
depends=("docker" "kubectl-bin")
optdepends=("google-cloud-sdk: To use GKE" 
            "minikube: To use Minikube")
source=("${pkgname}-${pkgver}::https://storage.googleapis.com/${pkgname}/releases/v${pkgver}/${pkgname}-linux-amd64")
sha256sums=("8cbc63500f3501b72c7c88bafa94f2120aa05aedc1488e50cca68e33cb57338b")

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
