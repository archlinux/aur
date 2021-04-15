# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>
pkgname=trex-bin
provides=('trex')
conflicts=('trex')
pkgver=0.20.1
pkgrel=1
pkgdesc="Cryptocurrency miner for NVIDIA hardware, supporting a variety of algorithms"
arch=('x86_64')
license=('custom')
url="https://github.com/trexminer/T-Rex"
options=('!strip')
depends=('nvidia-utils')
source=("t-rex_${pkgver}.tar.gz"::"https://github.com/trexminer/T-Rex/releases/download/${pkgver}/t-rex-${pkgver}-linux.tar.gz")
sha512sums=('3a21deaf117f15ec343dd56f739fbac441bebd3184aadb006739b8574708ed5f7135dc90c1e67200f763a9eeb05c47de9a9a71d38e1dae3cd74173ecaeb01b87')

package() {
    cd "${srcdir}"
    install -Dm755 "${srcdir}/t-rex" "${pkgdir}/usr/bin/t-rex"
}
