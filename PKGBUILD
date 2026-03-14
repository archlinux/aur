# Maintainer: noahra
pkgname=diz-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="Share SSH public keys between machines via a compact passphrase"
arch=('x86_64')
url="https://github.com/noahra/diz"
license=('MIT')
provides=('diz')
conflicts=('diz')
source_x86_64=("${url}/releases/download/v${pkgver}/diz-linux-x64")
sha256sums_x86_64=('61ed45d44d3411ff3ae4400d9f221a92a178b90bf1ad3dc1ecb51c19bd071696')

package() {
    install -Dm755 "${srcdir}/diz-linux-x64" "${pkgdir}/usr/bin/diz"
}
