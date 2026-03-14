# Maintainer: noahra
pkgname=diz-bin
pkgver=0.2.9
pkgrel=1
pkgdesc="Share SSH public keys between machines via a compact passphrase"
arch=('x86_64')
url="https://github.com/noahra/diz"
license=('MIT')
provides=('diz')
conflicts=('diz')
source_x86_64=("${url}/releases/download/v${pkgver}/diz-linux-x64")
sha256sums_x86_64=('f95b6350c3f0226fe01e2ba3db0077d758a29d8b9318cd0100b8efcaeb658050')

package() {
    install -Dm755 "${srcdir}/diz-linux-x64" "${pkgdir}/usr/bin/diz"
}
