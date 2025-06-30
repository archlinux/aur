# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.168
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.168/opencode-linux-arm64.zip")
sha256sums_aarch64=('da09356f5e591292796b7d680c6935befc9d4b51e27099bc656bf45701b02438')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.168/opencode-linux-x64.zip")
sha256sums_x86_64=('7ba19ed6130907bc324fba9abb5e911ca50bfdf8c69c082fe76f6dfb244087f6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
