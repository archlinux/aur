# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.14.1
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.14.1/opencode-linux-arm64.zip")
sha256sums_aarch64=('a6778e127efecc32b7fb9d9af3811a0a4c258c6e8eff97206274031e94eb34c5')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.14.1/opencode-linux-x64.zip")
sha256sums_x86_64=('50bbf39d8c10c0ad97063a0b780b653cc1cd4b89199f23ed27b71b27deaecd0a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
