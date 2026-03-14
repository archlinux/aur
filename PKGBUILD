# Maintainer: noahra
pkgname=diz-bin
pkgver=0.2.12
pkgrel=1
pkgdesc="Share SSH public keys between machines via a compact passphrase"
arch=('x86_64')
url="https://github.com/noahra/diz"
license=('MIT')
provides=('diz')
conflicts=('diz')
source_x86_64=("${url}/releases/download/v${pkgver}/diz-linux-x64")
sha256sums_x86_64=('ca171c16bb686d5fb9c835ea8c3833f8a572e1fe4cc9f605e85f5d15e5151d03')

package() {
    install -Dm755 "${srcdir}/diz-linux-x64" "${pkgdir}/usr/bin/diz"
}
