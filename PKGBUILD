# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.18
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.18/opencode-linux-arm64.zip")
sha256sums_aarch64=('82e979fce083c8ae648bc2e79d209605d3834e09789cd0e4fabe43a7dc0c2c26')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.18/opencode-linux-x64.zip")
sha256sums_x86_64=('fae6160aff1ebee2bdc37d576c2b6d8c614409004242d8ea529a836653a4907c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
