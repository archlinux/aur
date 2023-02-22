# Maintainer: Josh Gwosdz <jgwosdz at redhat dot com>
pkgname=operator-registry-opm-bin
pkgver=1.26.4
pkgrel=2
pkgdesc="Client tools for the Operator Registry that runs in a Kubernetes or OpenShift cluster to provide operator catalog data to Operator Lifecycle Manager."
arch=("x86_64")
provides=("opm")
url="https://github.com/operator-framework/operator-registry"
license=("Apache")
depends=()

source=("opm-$pkgname-$pkgver::https://github.com/operator-framework/operator-registry/releases/download/v${pkgver}/linux-amd64-opm")
sha256sums=('cf94e9dbd58c338e1eed03ca50af847d24724b99b40980812abbe540e8c7ff8e')

package() {
  install -Dm755 "${srcdir}/opm-$pkgname-$pkgver" "${pkgdir}/usr/bin/opm"
}
