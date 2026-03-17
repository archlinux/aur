# Maintainer: Enriquefft <https://github.com/Enriquefft>
pkgname=zq-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='A drop-in replacement for jq, 25x faster, written in Zig'
arch=('x86_64' 'aarch64')
url='https://github.com/Enriquefft/zq'
license=('MIT')
provides=('zq')
conflicts=('zq')

source_x86_64=("https://github.com/Enriquefft/zq/releases/download/v${pkgver}/zq-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/Enriquefft/zq/releases/download/v${pkgver}/zq-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('a48afe7884a78e89ce6554a64b50068fcf22dba91038f855341b48b3a02a87a3')
sha256sums_aarch64=('8e81242ca9358f6dd6e46a06e31ce0c1150d6a3d1717fabc411c74a8e2f401bb')

package() {
    install -Dm755 zq "${pkgdir}/usr/bin/zq"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
