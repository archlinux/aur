# Maintainer: Enriquefft <https://github.com/Enriquefft>
pkgname=zq-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='A drop-in replacement for jq, 25x faster, written in Zig'
arch=('x86_64' 'aarch64')
url='https://github.com/Enriquefft/zq'
license=('MIT')
provides=('zq')
conflicts=('zq')

source_x86_64=("https://github.com/Enriquefft/zq/releases/download/v${pkgver}/zq-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/Enriquefft/zq/releases/download/v${pkgver}/zq-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('3a5fc4ba359a284e0d1fb67fc628c44726dcdd872772c0c74ace86c003547c00')
sha256sums_aarch64=('f418023e891c50ac4b5f0941e448be27843b9e6ed70b75a660bce6bf95139fae')

package() {
    install -Dm755 zq "${pkgdir}/usr/bin/zq"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
