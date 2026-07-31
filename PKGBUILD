# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=0.2.117
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
sha512sums_x86_64=('d443293fbb396fafb1c72ac8d7ca8f09df1c9bc1052eb68fe11e13aa9d098d955d3f1e3774e2d248fc8fa7754df464799df0afadebbf6e6bc03ad5c2faa4e0b0')
sha512sums_aarch64=('3aaadf7f5afc90a0a80d99066799dbfc107bcef154f7d14c767adf5de25438e9551a3859645b5e71b6128dbcc2ef34364de174ab4c5ee65a796fab5e4c8afbcb')

package() {
  install -Dm 755 grok-$pkgver "${pkgdir}/usr/bin/grok"
}
