# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=copacetic-bin
pkgver=0.14.1
pkgrel=1
pkgdesc='CLI tool for directly patching container images'
arch=('x86_64' 'aarch64')
url='https://github.com/project-copacetic/copacetic'
license=('Apache-2.0')
provides=('copacetic' 'copa')
conflicts=('copacetic')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/copa_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/copa_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a780f62c054f60cd1aecbbf4a4b2665a816aa852534e6b0b9592cf96a327fdc9')
sha256sums_aarch64=('dad5ee9b8ad19ed63c87242e68cc1739dffbef07928faf3eb7cfdfa48ef2c2c7')

package() {
    install -Dm755 copa "${pkgdir}/usr/bin/copa"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
