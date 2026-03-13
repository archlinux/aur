# Maintainer: noahra
pkgname=diz-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="Share SSH public keys between machines via a compact passphrase"
arch=('x86_64')
url="https://github.com/noahra/diz"
license=('MIT')
provides=('diz')
conflicts=('diz')
source_x86_64=("${url}/releases/download/v${pkgver}/diz-linux-x64")
sha256sums_x86_64=('24a25924490fccb60047f0ea64abbcfd3d4aa6d70a6df8c4e03d54b28b9da47a')

package() {
    install -Dm755 "${srcdir}/diz-linux-x64" "${pkgdir}/usr/bin/diz"
}
