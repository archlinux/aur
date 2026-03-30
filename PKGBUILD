# Maintainer: Enriquefft <https://github.com/Enriquefft>
pkgname=zq-bin
pkgver=0.2.3
pkgrel=1
pkgdesc='A drop-in replacement for jq, 31x faster, written in Zig'
arch=('x86_64' 'aarch64')
url='https://github.com/Enriquefft/zq'
license=('MIT')
provides=('zq')
conflicts=('zq')

source_x86_64=("https://github.com/Enriquefft/zq/releases/download/v${pkgver}/zq-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/Enriquefft/zq/releases/download/v${pkgver}/zq-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('bbea720970c0efd00ab02fce11ae5f091337485c00623c2d278aa2c5e469133b')
sha256sums_aarch64=('f846e06c4255e1c519e4b48baabab9a3e2902ab77a8c2de837e5ee73482b365e')

package() {
    install -Dm755 zq "${pkgdir}/usr/bin/zq"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
