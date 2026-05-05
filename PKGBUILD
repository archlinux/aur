# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=copacetic-bin
pkgver=0.14.0
pkgrel=1
pkgdesc='CLI tool for directly patching container images'
arch=('x86_64' 'aarch64')
url='https://github.com/project-copacetic/copacetic'
license=('Apache-2.0')
provides=('copacetic' 'copa')
conflicts=('copacetic')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/copa_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/copa_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('9c5a4b89c639779975b86a2eaddd8e8261b0df8a52fa3f2507746512f77ea19c')
sha256sums_aarch64=('a5317fa8a03a926148b8532a55745db752ec102b7f90091c6fc2a5b6b05b274a')

package() {
    install -Dm755 copa "${pkgdir}/usr/bin/copa"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
