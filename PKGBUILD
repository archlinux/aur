# Maintainer: Platon Pronko < platon7pronko at gmail dot com >
pkgname=mill-global
pkgver=1.0.6
pkgrel=1
pkgdesc="Mill Build Tool, global installation"
arch=("any")
url="https://github.com/com-lihaoyi/mill"
license=("MIT")

source=("mill-${pkgver}::https://raw.githubusercontent.com/com-lihaoyi/mill/refs/tags/${pkgver}/mill")
sha256sums=('64cd978c39932399edfed54291036c949ef15458c43d982a37fc34f52e5b65b7')

package() {
    cd "${srcdir}"
    install -Dm755 "${srcdir}/mill-${pkgver}" "${pkgdir}/usr/bin/mill"
}
