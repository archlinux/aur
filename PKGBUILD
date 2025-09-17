# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.9.7
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.9.7/opencode-linux-arm64.zip")
sha256sums_aarch64=('e883618988da03950b4b5af7dc20d0c6b55cf0794413e791a2aadeef67b15208')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.9.7/opencode-linux-x64.zip")
sha256sums_x86_64=('13b254e6e73cec6bc457b34d95bedeb43203faf4813222beab11a97ea2900174')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
