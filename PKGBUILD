# Maintainer: noahra
pkgname=diz-bin
pkgver=0.2.11
pkgrel=1
pkgdesc="Share SSH public keys between machines via a compact passphrase"
arch=('x86_64')
url="https://github.com/noahra/diz"
license=('MIT')
provides=('diz')
conflicts=('diz')
source_x86_64=("${url}/releases/download/v${pkgver}/diz-linux-x64")
sha256sums_x86_64=('4e9764b1857412949579a663a937a80e0ff841287a1b5b70596211153b475a0f')

package() {
    install -Dm755 "${srcdir}/diz-linux-x64" "${pkgdir}/usr/bin/diz"
}
