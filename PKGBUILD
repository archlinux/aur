# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=0.2.101
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
sha512sums_x86_64=('7365896faf53c40e23673a5ed4642a046a43069a284b464f0bb97f5ffd50b7a3f2c2b119b1e98dcb0ce83985a85cb2a3b567e9848cb93f7a72fb818d1e2063fa')
sha512sums_aarch64=('9e25fec147e4413db363270bd711a42a142fd5f6dd7d49bb1613d6bd9e679c1f3e2ae8a73f73654a4dedb0800d6e92efe196a4a68f068b8855b54cba9a02b5dc')

package() {
  install -Dm 755 grok-$pkgver "${pkgdir}/usr/bin/grok"
}
