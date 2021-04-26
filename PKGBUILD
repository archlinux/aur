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
source=("t-rex_${pkgver}.tar.gz"::"https://github.com/trexminer/T-Rex/releases/download/${pkgver}/t-rex-${pkgver}-linux.tar.gz")
sha512sums=('2ccb0a27c2af6dc563e115c6d74ffaf7398bf09cba25689385021dcdfb14526b1d73ca1703a09d83ea1dfeb614074ff9873abf517f54c777eab783e0765e1810')

package() {
    cd "${srcdir}"
    install -Dm755 "${srcdir}/t-rex" "${pkgdir}/usr/bin/t-rex"
}
