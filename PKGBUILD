# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=0.2.111
pkgrel=1
pkgdesc="Grok CLI - command line interface for xAI's Grok"
arch=('x86_64' 'aarch64')
url="https://x.ai/cli"
license=('LicenseRef-xAI-Grok-CLI')
provides=('grok')
conflicts=('grok')
options=('!strip')
source_x86_64=("grok-$pkgver::https://x.ai/cli/grok-${pkgver}-linux-x86_64")
source_aarch64=("grok-$pkgver-aarch64::https://x.ai/cli/grok-${pkgver}-linux-aarch64")
sha512sums_x86_64=('67c1745b45e37aef0576a5eef2ba4fef7232a6289585388fcd363a751d54062639e4820d3b9620a093d51248bbdea967aadb7646a78b8a8a42d5f6e9aeb79570')
sha512sums_aarch64=('059a49dd5fce8889bc522c2553b58246478a0cd5f7fcfb7aa823b0dd7ad2d365f9d53070789c4ee40193738e2fea17b3a1a11178834b4f8ed7933b6951191ff0')

package() {
  install -Dm 755 grok-$pkgver "${pkgdir}/usr/bin/grok"
}
