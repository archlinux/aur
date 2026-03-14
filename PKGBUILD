# Maintainer: Enriquefft <https://github.com/Enriquefft>
pkgname=zq-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='A drop-in replacement for jq, 25x faster, written in Zig'
arch=('x86_64' 'aarch64')
url='https://github.com/Enriquefft/zq'
license=('MIT')
provides=('zq')
conflicts=('zq')

source_x86_64=("https://github.com/Enriquefft/zq/releases/download/v${pkgver}/zq-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/Enriquefft/zq/releases/download/v${pkgver}/zq-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('PLACEHOLDER')
sha256sums_aarch64=('PLACEHOLDER')

package() {
    install -Dm755 zq "${pkgdir}/usr/bin/zq"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
