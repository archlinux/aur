# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.106
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.106/opencode-linux-arm64.zip")
sha256sums_aarch64=('b695f0b3ee5105bdd4ab7d777da4a14b59f5370507620d852b8827ca840428a2')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.106/opencode-linux-x64.zip")
sha256sums_x86_64=('42ce91d70b10cd759db0ea6d593c9dae4f1d3a6eb164120e8abfc142ed9a725f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
