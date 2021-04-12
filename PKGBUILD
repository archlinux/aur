# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>
pkgname=trex-bin
provides=('trex')
conflicts=('trex')
pkgver=0.20.0
pkgrel=1
pkgdesc="Cryptocurrency miner for NVIDIA hardware, supporting a variety of algorithms"
arch=('x86_64')
license=('custom')
url="https://github.com/trexminer/T-Rex"
options=('!strip')
depends=('nvidia-utils')
source=("t-rex_${pkgver}.tar.gz"::"https://github.com/trexminer/T-Rex/releases/download/${pkgver}/t-rex-${pkgver}-linux.tar.gz")
sha512sums=('693813f27d1e6299a68610d0ac9a18c400a960ef0f0922f184ad8287f6967a0600558c9825864b66902c0ca181d81f66ed935e3f4f99f498247cc96562b6f16a')

package() {
    cd "${srcdir}"
    install -Dm755 "${srcdir}/t-rex" "${pkgdir}/usr/bin/t-rex"
}
