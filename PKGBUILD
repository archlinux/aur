# Maintainer: tobocop <tobias.perelstein@gmail.com>
pkgname=lilbee
pkgver=0.6.66b479
pkgrel=1
pkgdesc="Local search engine and personal encyclopedia for your notes, code, and PDFs"
arch=('x86_64')
url="https://github.com/tobocop2/lilbee"
license=('custom:Elastic-2.0')
replaces=('lilbee-bin')
options=('!strip' '!debug')
source_x86_64=("lilbee-${pkgver}::${url}/releases/download/v${pkgver}/lilbee-linux-${CARCH}")
sha256sums_x86_64=('10dd276bdab5aa4edda50f6611f49e8bcc947506905223272d55b20b0c82c75a')

package() {
    install -Dm755 "${srcdir}/lilbee-${pkgver}" "${pkgdir}/usr/bin/lilbee"
}
