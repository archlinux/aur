# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=0.2.52
pkgrel=1
pkgdesc="Grok CLI - command line interface for xAI's Grok"
arch=('x86_64' 'aarch64')
url="https://x.ai/cli"
license=('LicenseRef-xAI-Grok-CLI')
provides=('grok')
conflicts=('grok')
options=('!strip')
source_x86_64=("grok::https://x.ai/cli/grok-${pkgver}-linux-x86_64")
source_aarch64=("grok::https://x.ai/cli/grok-${pkgver}-linux-aarch64")
sha512sums_x86_64=('6feb8457cbcc5e9ec96c11f18e8d26b4687ffa859dc8204723d15e09fd10794c5a02610caed556b47ce205cbe32c2fcf7b13598b007c6ef66ae8f9c7307d0f84')
sha512sums_aarch64=('6feb8457cbcc5e9ec96c11f18e8d26b4687ffa859dc8204723d15e09fd10794c5a02610caed556b47ce205cbe32c2fcf7b13598b007c6ef66ae8f9c7307d0f84')

package() {
  install -Dm 755 grok "${pkgdir}/usr/bin/grok"
}
