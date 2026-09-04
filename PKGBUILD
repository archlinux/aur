# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=copacetic-bin
pkgver=0.15.0
pkgrel=1
pkgdesc='CLI tool for directly patching container images'
arch=('x86_64' 'aarch64')
url='https://github.com/project-copacetic/copacetic'
license=('Apache-2.0')
provides=('copacetic' 'copa')
conflicts=('copacetic')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/copa_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/copa_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('cff3fe9320f3bd24bafcfd0ce877ef57e23acad0836da0ac6c253919f71c9cad')
sha256sums_aarch64=('2444b6109c6164beef980641ec5f2813bc42b1703add6dd73591ace23051ca8f')

package() {
    install -Dm755 copa "${pkgdir}/usr/bin/copa"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
