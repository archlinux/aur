# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=0.2.99
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
sha512sums_x86_64=('e7ced60c74bbb08a6ce298ca1c736c2361db363f58f7a518cb974663697b737d032142f0c33187c3da205da27e71acf2b67ebf85aea99f2a9040955bc6121f1f')
sha512sums_aarch64=('161b964acd9203c23fe1b86a9c4c7971d10b5329d0660afd46783e4a9f5773a201590211d3f30f53b576f80db9abf77765978c9559d406fa349c2cf5ecef4014')

package() {
  install -Dm 755 grok-$pkgver "${pkgdir}/usr/bin/grok"
}
