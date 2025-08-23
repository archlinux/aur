# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.5.17
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.5.17/opencode-linux-arm64.zip")
sha256sums_aarch64=('b7d357640aa78ffe5486e3400a52294fa381ca05031bd94004215a67ebc5a0c3')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.5.17/opencode-linux-x64.zip")
sha256sums_x86_64=('c2a4e6582eee5656ab28e1b7cfa2f207eb95dd798600c1a49ddd7e7dde68b595')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
