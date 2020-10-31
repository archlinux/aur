# Maintainer: Marco Steiger <marco (at) steiger (dot) online>
pkgname=kerbrute-bin
pkgver=1.0.3
pkgrel=1
pkgdesc='A tool to perform Kerberos pre-auth bruteforcing'
arch=('x86_64')
url="https://github.com/ropnop/kerbrute"
license=('Apache')
source=("kerbrute::https://github.com/ropnop/kerbrute/releases/download/v${pkgver}/kerbrute_linux_amd64")
sha256sums=('710a9d2653c8bd3689e451778dab9daec0de4c4c75f900788ccf23ef254b122a')

package() {
    install -Dm755 "${srcdir}/kerbrute" "${pkgdir}/usr/bin/kerbrute"
}

