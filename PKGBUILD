# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=0.2.106
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
sha512sums_x86_64=('7dadaef835e1b065ef3081c850f52685f57a4a5efa165141ee763d821bb0af126c8d5f1cfc2be966f1914d54ee3570feb62905b25271dcdffb2902f52fa2bd16')
sha512sums_aarch64=('869537daccd3c1dffbc16236220d6958e714158595050778e43ba92a36d3cde5715e07ebb99623f20992c2ad65a3216d93ca8e9392efa2905a30949893fb141b')

package() {
  install -Dm 755 grok-$pkgver "${pkgdir}/usr/bin/grok"
}
