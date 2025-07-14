# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.1
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.1/opencode-linux-arm64.zip")
sha256sums_aarch64=('51f2871420a2b42dc068125f95f0b5bf76a87fe1a1129829aa217cf8efabf1ae')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.1/opencode-linux-x64.zip")
sha256sums_x86_64=('8ddc2b81ab4e53051778afb8a1921aa41d6976790dcce8280e90405ee51c0add')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
