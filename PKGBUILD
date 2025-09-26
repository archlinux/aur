# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.11.7
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.11.7/opencode-linux-arm64.zip")
sha256sums_aarch64=('93dbcbab309a45ba55a228085ae40b713f7fd883ccfe0c8ba98b163119e76728')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.11.7/opencode-linux-x64.zip")
sha256sums_x86_64=('16b9e86863527137f11ca3209d101406e9973069e2904278c348e13adcb53617')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
