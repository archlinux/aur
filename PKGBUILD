# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=copacetic-bin
pkgver=0.13.0
pkgrel=1
pkgdesc='CLI tool for directly patching container images'
arch=('x86_64' 'aarch64')
url='https://github.com/project-copacetic/copacetic'
license=('Apache-2.0')
provides=('copacetic' 'copa')
conflicts=('copacetic')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/copa_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/copa_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('a3f91b3ac70bb8c4a4bdd984951e2f642b7d3fc9c22bf0533f7c33884355ac7a')
sha256sums_aarch64=('0d18c49b3c0ed082136e2537b737e1705a1c9bb348448aea990b49f6dcca5e72')

package() {
    install -Dm755 copa "${pkgdir}/usr/bin/copa"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
