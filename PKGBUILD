# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.34
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.34/opencode-linux-arm64.zip")
sha256sums_aarch64=('e77290dcc91253d56fec3eb840e0ff2e892b6aabfa11bfb07be09c1c9b61d304')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.34/opencode-linux-x64.zip")
sha256sums_x86_64=('a94752758c803faa44b32e7404a292a6825d6a5c530e16ee85905651473082e0')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
