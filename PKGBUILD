# Maintainer: Burkhard Pauli <burkhard at pauli dot tech>
pkgname=gccli-bin
pkgver=1.7.3
pkgrel=1
pkgdesc="A command-line interface for Garmin Connect — activities, health, courses, workouts, devices, and more"
arch=('x86_64')
url="https://github.com/bpauli/gccli"
license=('MIT')
provides=('gccli')
conflicts=('gccli')
source=("${url}/releases/download/v${pkgver}/gccli_${pkgver}_linux_amd64.tar.gz")
sha256sums=('7068f4d6e8b714d63bf65d2eca149a0ed3c1ee45e938ececf2cbfde1d711e11c')

package() {
    install -Dm755 gccli "${pkgdir}/usr/bin/gccli"
}
