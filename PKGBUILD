# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.39
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.39/opencode-linux-arm64.zip")
sha256sums_aarch64=('2dff6162a9eafc8baa8c84ca8d038c3447eefa1365aeecd771153778ecdcc37e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.39/opencode-linux-x64.zip")
sha256sums_x86_64=('74ba3c515cd4cad4c6fb5564adc88c9337ae060ffeb6ef96f6bbe9470266676a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
