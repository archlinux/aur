# Maintainer: Sarat Chandra <me at saratchandra dot in>

pkgname=danse-bin
_pkgver=0.4.0
pkgver=v${_pkgver}
pkgrel=1
pkgdesc="A DNS proxy for DNS Over HTTPS/DNS Over TLS/DNSCrypt"
arch=('x86_64' 'aarch64')
url="https://github.com/iamd3vil/danse"
license=('MIT')
depends=()
makedepends=()
provides=('danse')
conflicts=()
source_x86_64=("https://github.com/iamd3vil/danse/releases/download/${pkgver}/danse_${_pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("https://github.com/iamd3vil/danse/releases/download/${pkgver}/danse_${_pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('e400e9434852dbb9781fefe4808a65a27fb0445f95a8e304dd750e80f923bf48')
sha256sums_aarch64=('3a13dddf2b04422d2dee14283c8b2c3705b5bcaa4eeb078db21e1da491d15ecf')

package() {
    cd "${srcdir}"

    # Install danse
    install -D -m0755 danse \
        "${pkgdir}/usr/bin/danse"
}
