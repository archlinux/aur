# Maintainer: Roland Rodriguez <roland@govcraft.ai>
pkgname=emergent-bin
pkgver=0.10.5
pkgrel=1
pkgdesc="Event-driven workflow engine using publish-subscribe primitives"
arch=('x86_64' 'aarch64')
url="https://github.com/GovCraft/emergent"
license=('MIT' 'Apache-2.0')
provides=('emergent')
conflicts=('emergent')

source_x86_64=("${url}/releases/download/v${pkgver}/emergent-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/emergent-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d1ad65650a8bc7c60824fa9f8f6db3741ef8901b99e115eb051c62849a1bd35b')
sha256sums_aarch64=('a531eba9a2f2d2bfec4c7be157c139ec8ea6017c8a8a2607cda3296ef6df183c')

package() {
    install -Dm755 emergent "${pkgdir}/usr/bin/emergent"
}
