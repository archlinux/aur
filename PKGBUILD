# Maintainer: Josh Gwosdz <jgwosdz at redhat dot com>
pkgname=operator-registry-opm-bin
pkgver=1.36.0
pkgrel=1
pkgdesc="Client tools for the Operator Registry that runs in a Kubernetes or OpenShift cluster to provide operator catalog data to Operator Lifecycle Manager."
arch=("x86_64")
provides=("opm")
url="https://github.com/operator-framework/operator-registry"
license=("Apache")
depends=()

source=("opm-$pkgname-$pkgver::https://github.com/operator-framework/operator-registry/releases/download/v${pkgver}/linux-amd64-opm")
sha256sums=('0883eb4b07c91ef2d653e7cf08db1caf91f397d72c6c45127895701b9b4e0dd3')

package() {
  install -Dm755 "${srcdir}/opm-$pkgname-$pkgver" "${pkgdir}/usr/bin/opm"
}
