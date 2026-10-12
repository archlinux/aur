# Maintainer: Burkhard Pauli <burkhard at pauli dot tech>
pkgname=gccli-bin
pkgver=1.13.0
pkgrel=1
pkgdesc="A command-line interface for Garmin Connect — activities, health, courses, workouts, devices, and more"
arch=('x86_64')
url="https://github.com/bpauli/gccli"
license=('MIT')
provides=('gccli')
conflicts=('gccli')
source=("${url}/releases/download/v${pkgver}/gccli_${pkgver}_linux_amd64.tar.gz")
sha256sums=('b4525d7ac54075627a6dfdae0a93dc6db62035a3910e8a8904202f6fa20645e1')

package() {
    install -Dm755 gccli "${pkgdir}/usr/bin/gccli"
}
