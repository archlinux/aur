# Maintainer: tobocop <tobias.perelstein@gmail.com>
pkgname=lilbee-cuda
pkgver=0.6.66b476
pkgrel=1
pkgdesc="Local search engine and personal encyclopedia for your notes, code, and PDFs (CUDA build)"
arch=('x86_64')
url="https://github.com/tobocop2/lilbee"
license=('custom:Elastic-2.0')
conflicts=('lilbee')
provides=('lilbee')
options=('!strip' '!debug')
source_x86_64=("lilbee-${pkgver}-cu125::${url}/releases/download/v${pkgver}/lilbee-linux-${CARCH}-cu125")
sha256sums_x86_64=('71e84f731d25f0d9fba17d4852f301e59407a51fb0a20f07ba3649845760766d')

package() {
    install -Dm755 "${srcdir}/lilbee-${pkgver}-cu125" "${pkgdir}/usr/bin/lilbee"
}
