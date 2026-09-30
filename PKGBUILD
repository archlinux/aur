# Maintainer: Roland Rodriguez <roland@govcraft.ai>
pkgname=emergent-bin
pkgver=0.15.0
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
sha256sums_x86_64=('62c77fcff56d5c5c0d36b80195592d5e94968a76130339d3a83c788140ebc4a4' 'SKIP')
sha256sums_aarch64=('a69832631768c161f32d117b194b716c39c72479147adb53f29fc56a6fd3169e' 'SKIP')

package() {
    install -Dm755 emergent "${pkgdir}/usr/bin/emergent"
}
