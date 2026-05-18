# Maintainer: tobocop <tobias.perelstein@gmail.com>
pkgname=lilbee-cuda
pkgver=0.6.66b477
pkgrel=1
pkgdesc="Local search engine and personal encyclopedia for your notes, code, and PDFs (CUDA build)"
arch=('x86_64')
url="https://github.com/tobocop2/lilbee"
license=('custom:Elastic-2.0')
conflicts=('lilbee')
provides=('lilbee')
options=('!strip' '!debug')
source_x86_64=("lilbee-${pkgver}-cu125::${url}/releases/download/v${pkgver}/lilbee-linux-${CARCH}-cu125")
sha256sums_x86_64=('b9557f436c9a9f31eb3973762100f7d8720d88e81d668863c6cdfb50ff0016c3')

package() {
    install -Dm755 "${srcdir}/lilbee-${pkgver}-cu125" "${pkgdir}/usr/bin/lilbee"
}
