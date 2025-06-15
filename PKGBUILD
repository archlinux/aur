# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.52
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.52/opencode-linux-arm64.zip")
sha256sums_aarch64=('58ad5a7b1a385fdd4f24603ff2d2f3ab25027f235585de73bd88d979ea5b2336')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.52/opencode-linux-x64.zip")
sha256sums_x86_64=('4fec384f5d5f7d12eb51d5a19d9ff96ed00f637d6c4548c3bfd6455243296f92')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
