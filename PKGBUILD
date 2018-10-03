# Maintainer: Fredy García <frealgagu at gmail dot com>

pkgname=skaffold
pkgver=0.15.1
pkgrel=1
pkgdesc="A command line tool that facilitates continuous development for Kubernetes applications"
arch=("x86_64")
url="https://github.com/GoogleContainerTools/${pkgname}"
license=("APACHE")
depends=("docker" "kubectl-bin")
optdepends=("google-cloud-sdk: To use GKE" 
            "minikube: To use Minikube")
source=("${pkgname}-${pkgver}::https://storage.googleapis.com/${pkgname}/releases/v${pkgver}/${pkgname}-linux-amd64")
sha256sums=("af9f1999dd0120ac239a4d4619803ba91fc596d9b04661d289f2bd6fdf8a7517")

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
