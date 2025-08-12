# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.4.23
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.23/opencode-linux-arm64.zip")
sha256sums_aarch64=('b204290a8c1898ef15b5578b30f5ce6f02e2f308422e784f03ad561b6c5e08a3')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.23/opencode-linux-x64.zip")
sha256sums_x86_64=('efeeab67ba2c6894c63d5d2a79f607ad986b8644eca7e1ac1c927a834930a44a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
