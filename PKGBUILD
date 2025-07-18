# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.21
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.21/opencode-linux-arm64.zip")
sha256sums_aarch64=('0770e9492686cc6b82c77a54604e3ace2854f90f6da69aeeb9c56ef3d4e1ddbf')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.21/opencode-linux-x64.zip")
sha256sums_x86_64=('e06a32fcc6196db6e729f28c0ab18d1383c52eda731998195d57b6510552ff0a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
