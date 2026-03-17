# Maintainer: Roland Rodriguez <roland@govcraft.ai>
pkgname=emergent-bin
pkgver=0.10.7
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
sha256sums_x86_64=('5f1ed8787a956d4019f503cb63897be32f14530995812926342f2ed350750239' 'SKIP')
sha256sums_aarch64=('6ca51f1a8c2fa978b5982f1cce01f974f4d27e6b3b3d761c2c532c808da76628' 'SKIP')

package() {
    install -Dm755 emergent "${pkgdir}/usr/bin/emergent"
}
