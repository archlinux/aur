# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.5.15
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.5.15/opencode-linux-arm64.zip")
sha256sums_aarch64=('bfe6559fd40ea0386964654713fb6edc70ee92985c7d2f97f0b5bb5ff56d9914')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.5.15/opencode-linux-x64.zip")
sha256sums_x86_64=('c6c4f0572f69c5ec5a6782b2dcb92dd8d17dd8df78df4804301675f70d5d115b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
