# Maintainer: Burkhard Pauli <burkhard at pauli dot tech>
pkgname=gccli-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="A command-line interface for Garmin Connect — activities, health, courses, workouts, devices, and more"
arch=('x86_64')
url="https://github.com/bpauli/gccli"
license=('MIT')
provides=('gccli')
conflicts=('gccli')
source=("${url}/releases/download/v${pkgver}/gccli_${pkgver}_linux_amd64.tar.gz")
sha256sums=('21c34c1535b6a8d0b7c8131b8b5bee348897714e9a3e473ff59bc2f37d56e2da')

package() {
    install -Dm755 gccli "${pkgdir}/usr/bin/gccli"
}
