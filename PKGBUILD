# Maintainer: tobocop <tobias.perelstein@gmail.com>
pkgname=lilbee
pkgver=0.6.66b476
pkgrel=1
pkgdesc="Local search engine and personal encyclopedia for your notes, code, and PDFs"
arch=('x86_64')
url="https://github.com/tobocop2/lilbee"
license=('custom:Elastic-2.0')
replaces=('lilbee-bin')
options=('!strip' '!debug')
source_x86_64=("lilbee-${pkgver}::${url}/releases/download/v${pkgver}/lilbee-linux-${CARCH}")
sha256sums_x86_64=('c22ed4ed20545d04268bfd9e24a13759b294f105f836c0d898d9794d2454b6a7')

package() {
    install -Dm755 "${srcdir}/lilbee-${pkgver}" "${pkgdir}/usr/bin/lilbee"
}
