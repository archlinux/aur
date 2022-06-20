# Maintainer: Josh Gwosdz <jgwosdz at redhat dot com>
pkgname=operator-registry-opm-bin
pkgver=1.23.0
pkgrel=2
pkgdesc="Client tools for the Operator Registry that runs in a Kubernetes or OpenShift cluster to provide operator catalog data to Operator Lifecycle Manager."
arch=("x86_64")
provides=("opm")
url="https://github.com/operator-framework/operator-registry"
license=("Apache")
depends=()

source=("opm-$pkgname-$pkgver::https://github.com/operator-framework/operator-registry/releases/download/v${pkgver}/linux-amd64-opm")
sha256sums=('dc0d4d287fef23f165c837b2e6cb68e2506ff295dc57110b9bfe3b553359eb36')

package() {
  install -Dm755 "${srcdir}/opm-$pkgname-$pkgver" "${pkgdir}/usr/bin/opm"
}
