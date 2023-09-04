# Maintainer: Josh Gwosdz <jgwosdz at redhat dot com>
pkgname=operator-registry-opm-bin
pkgver=1.29.0
pkgrel=2
pkgdesc="Client tools for the Operator Registry that runs in a Kubernetes or OpenShift cluster to provide operator catalog data to Operator Lifecycle Manager."
arch=("x86_64")
provides=("opm")
url="https://github.com/operator-framework/operator-registry"
license=("Apache")
depends=()

source=("opm-$pkgname-$pkgver::https://github.com/operator-framework/operator-registry/releases/download/v${pkgver}/linux-amd64-opm")
sha256sums=('994d48a265ab019a27bab4fb2ffa327e34f1e8b93bd604079a0d397f641608a1')

package() {
  install -Dm755 "${srcdir}/opm-$pkgname-$pkgver" "${pkgdir}/usr/bin/opm"
}
