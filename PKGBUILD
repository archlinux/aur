# Maintainer: Roland Rodriguez <roland@govcraft.ai>
pkgname=emergent-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="Event-driven workflow engine using publish-subscribe primitives"
arch=('x86_64' 'aarch64')
url="https://github.com/Govcraft/emergent"
license=('MIT' 'Apache-2.0')
provides=('emergent')
conflicts=('emergent')

validpgpkeys=('EDAAD3730AB9855765E57445965785C9F837377C')

source_x86_64=("${url}/releases/download/v${pkgver}/emergent-${pkgver}-x86_64-unknown-linux-gnu.tar.gz"
               "${url}/releases/download/v${pkgver}/emergent-${pkgver}-x86_64-unknown-linux-gnu.tar.gz.asc")
source_aarch64=("${url}/releases/download/v${pkgver}/emergent-${pkgver}-aarch64-unknown-linux-gnu.tar.gz"
                "${url}/releases/download/v${pkgver}/emergent-${pkgver}-aarch64-unknown-linux-gnu.tar.gz.asc")
sha256sums_x86_64=('1fb458140e3a085c1aadc1c993a790876c5033334ff054ed7e0ff6689690c281' 'SKIP')
sha256sums_aarch64=('10a9693aeee5ea29b26999c971c0b488e17f65c325b6483ad885df9e16b6e55d' 'SKIP')

package() {
    install -Dm755 emergent "${pkgdir}/usr/bin/emergent"
}
