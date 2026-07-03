# Maintainer: Benigno B. Junior <benignobjunior@gmail.com>
pkgname=copacetic-bin
pkgver=0.14.2
pkgrel=1
pkgdesc='CLI tool for directly patching container images'
arch=('x86_64' 'aarch64')
url='https://github.com/project-copacetic/copacetic'
license=('Apache-2.0')
provides=('copacetic' 'copa')
conflicts=('copacetic')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/copa_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/copa_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('756c6e0f287dc7839c0a72e91b4d4712b1d8cd86a7233c068c0208a28bcb9ede')
sha256sums_aarch64=('a7595083940c7d89a579c3bd8db74acec9b9ee7281ef29037f2dd53b07fddc1a')

package() {
    install -Dm755 copa "${pkgdir}/usr/bin/copa"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
