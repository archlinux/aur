# Maintainer: Roland Rodriguez <roland@govcraft.ai>
pkgname=emergent-bin
pkgver=0.14.0
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
sha256sums_x86_64=('c6f84cc2346ad66898314d8955898e8623e48cb641c767389cc43fec18cc7c32' 'SKIP')
sha256sums_aarch64=('2d6261dab705bbc741789637faf95a283fec4c91a45cf5136e1ce606985d4898' 'SKIP')

package() {
    install -Dm755 emergent "${pkgdir}/usr/bin/emergent"
}
