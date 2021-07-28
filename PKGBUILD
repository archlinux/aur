# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>
pkgname=trex-bin
provides=('trex')
conflicts=('trex')
pkgver=0.21.5
pkgrel=1
pkgdesc="Cryptocurrency miner for NVIDIA hardware, supporting a variety of algorithms"
arch=('x86_64')
license=('custom')
url="https://bitcointalk.org/index.php?topic=4432704.0"
options=('!strip')
depends=('nvidia-utils')
source=("t-rex_${pkgver}.tar.gz"::"https://trex-miner.com/download/t-rex-${pkgver}-linux.tar.gz")
sha256sums=('47413431f795a854613d4cf9e48ea99966c3b641f2fc6959adccd0f87559a325')

package() {
    cd "${srcdir}"
    install -Dm755 "${srcdir}/t-rex" "${pkgdir}/usr/bin/t-rex"
}
