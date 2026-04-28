# Maintainer: Burkhard Pauli <burkhard at pauli dot tech>
pkgname=gccli-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="A command-line interface for Garmin Connect — activities, health, courses, workouts, devices, and more"
arch=('x86_64')
url="https://github.com/bpauli/gccli"
license=('MIT')
provides=('gccli')
conflicts=('gccli')
source=("${url}/releases/download/v${pkgver}/gccli_${pkgver}_linux_amd64.tar.gz")
sha256sums=('4d8317ab91c3fda3adc83a771bb473f16bbf36ecb2639feb3b323a352257d42a')

package() {
    install -Dm755 gccli "${pkgdir}/usr/bin/gccli"
}
