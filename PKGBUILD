# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=0.2.112
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
sha512sums_x86_64=('23a2b4c8b55f7d165b085e705d647f78b37986de192f6e2b554478fe3826b4d7afe1124cab65b8b478d61f9c8b35b6a180c8fbaedf47dfc7f2875201a33dab3c')
sha512sums_aarch64=('11caa6171329994d83c40bce600977b0cca0ee419958d5792bdfeea7bf60f1993dd3868aa067abb8ce352dbf7e7510cf9b8e63e522cf7beaf8fd199738178fb5')

package() {
  install -Dm 755 grok-$pkgver "${pkgdir}/usr/bin/grok"
}
