# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.67
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.67/opencode-linux-arm64.zip")
sha256sums_aarch64=('c22bf89b17492139aeba091447ea90ff88b9b4f803a3aeb63edfa239574a9772')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.67/opencode-linux-x64.zip")
sha256sums_x86_64=('d63f6e76a13766d6b8a913cce1d7b8c76e3ac3546bc1565fb90e2a6161f9643e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
