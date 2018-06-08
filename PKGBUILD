# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=skaffold
pkgver=0.7.0
pkgrel=1
pkgdesc="A command line tool that facilitates continuous development for Kubernetes applications"
arch=("x86_64")
url="https://github.com/GoogleContainerTools/${pkgname}"
license=("APACHE")
depends=("docker" "kubectl-bin")
optdepends=("google-cloud-sdk: To use GKE" 
            "minikube: To use Minikube")
source=("${pkgname}-${pkgver}::https://storage.googleapis.com/${pkgname}/releases/v${pkgver}/${pkgname}-linux-amd64")
sha256sums=("e6f54cab44406243c78665127c1469ed31e98348e1e18faee3e1eb005a22b7e3")

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
