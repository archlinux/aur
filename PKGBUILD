# Maintainer: Josh Gwosdz <jgwosdz at redhat dot com>
pkgname=operator-registry-opm-bin
pkgver=1.22.1
pkgrel=2
pkgdesc="Client tools for the Operator Registry that runs in a Kubernetes or OpenShift cluster to provide operator catalog data to Operator Lifecycle Manager."
arch=("x86_64")
provides=("opm")
url="https://github.com/operator-framework/operator-registry"
license=("Apache")
depends=()

source=("opm-$pkgname-$pkgver::https://github.com/operator-framework/operator-registry/releases/download/v${pkgver}/linux-amd64-opm")
sha256sums=('7199eecb93c2d459b0abab74e06331eabe7905c3ac2a469a1054805cb7862b82')

package() {
  install -Dm755 "${srcdir}/opm-$pkgname-$pkgver" "${pkgdir}/usr/bin/opm"
}
