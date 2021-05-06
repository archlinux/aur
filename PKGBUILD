# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>
pkgname=trex-bin
provides=('trex')
conflicts=('trex')
pkgver=0.20.3
pkgrel=1
pkgdesc="Cryptocurrency miner for NVIDIA hardware, supporting a variety of algorithms"
arch=('x86_64')
license=('custom')
url="https://github.com/trexminer/T-Rex"
options=('!strip')
depends=('nvidia-utils')
source=("t-rex_${pkgver}.tar.gz"::"https://trex-miner.com/download/t-rex-${pkgver}-linux.tar.gz")
sha1sums=('e1ade18610e3ac4dc1bae61a24ae590d85813d23')

package() {
    cd "${srcdir}"
    install -Dm755 "${srcdir}/t-rex" "${pkgdir}/usr/bin/t-rex"
}
