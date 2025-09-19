# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.10.2
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.10.2/opencode-linux-arm64.zip")
sha256sums_aarch64=('261d772d8df19cac78166e926387592064efd6c2cd730d38aae1b943ccbb4a5b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.10.2/opencode-linux-x64.zip")
sha256sums_x86_64=('17d2bf6da9d00c8d7b258c85e8a9c857efb8a3c963f6720462e626287d29474c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
