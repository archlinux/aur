# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=grok-build
pkgver=0.2.92
pkgrel=1
pkgdesc="Grok CLI - command line interface for xAI's Grok"
arch=('x86_64' 'aarch64')
url="https://x.ai/cli"
license=('LicenseRef-xAI-Grok-CLI')
provides=('grok')
conflicts=('grok')
options=('!strip')
source_x86_64=("grok-$pkgver::https://x.ai/cli/grok-${pkgver}-linux-x86_64")
source_aarch64=("grok::https://x.ai/cli/grok-${pkgver}-linux-aarch64")
sha512sums_x86_64=('a42eb7b3825d709fca59409164c3ec8fa54b93d446f82e4d6d84852908ad505d062af1b7b49f73367d4905d4d5f3fa9cecb52e7e074441f708f60a4539d9329f')
sha512sums_aarch64=('a42eb7b3825d709fca59409164c3ec8fa54b93d446f82e4d6d84852908ad505d062af1b7b49f73367d4905d4d5f3fa9cecb52e7e074441f708f60a4539d9329f')

package() {
  install -Dm 755 grok-$pkgver "${pkgdir}/usr/bin/grok"
}
