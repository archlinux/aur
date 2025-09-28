# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.12.2
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.12.2/opencode-linux-arm64.zip")
sha256sums_aarch64=('6a2f7f4b36c460070bdb7e3e4304369383489c08c6d4b25029d84cb38ac95ec5')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.12.2/opencode-linux-x64.zip")
sha256sums_x86_64=('e8d9a59a5b3e20db404b425ab1421f7e811a417173f7135db7cd22e968abdb07')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
