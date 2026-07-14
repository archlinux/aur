# Maintainer: Burkhard Pauli <burkhard at pauli dot tech>
pkgname=gccli-bin
pkgver=1.9.1
pkgrel=1
pkgdesc="A command-line interface for Garmin Connect — activities, health, courses, workouts, devices, and more"
arch=('x86_64')
url="https://github.com/bpauli/gccli"
license=('MIT')
provides=('gccli')
conflicts=('gccli')
source=("${url}/releases/download/v${pkgver}/gccli_${pkgver}_linux_amd64.tar.gz")
sha256sums=('f63d072fed71caf3f9d3d2b7ea684e3b82ab4763608caf14c3c09149dea6af31')

package() {
    install -Dm755 gccli "${pkgdir}/usr/bin/gccli"
}
