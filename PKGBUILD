# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.5.21
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.5.21/opencode-linux-arm64.zip")
sha256sums_aarch64=('1858fb6527bf4a502b0582f6ad9b98d93c440b119481bb49b5cca813eae813b9')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.5.21/opencode-linux-x64.zip")
sha256sums_x86_64=('3d0e0e015778ffaa713d4b0c4aff77bb0ab932dc1773e2c738e583b5b6716dee')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
