# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.126
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.126/opencode-linux-arm64.zip")
sha256sums_aarch64=('d30487d3befab8aa44923660b548b08a09fdea70f24d0b7f4845e1c52645a2af')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.126/opencode-linux-x64.zip")
sha256sums_x86_64=('f3f4ea0f4e7ab7a27c9f6eaff59eb7c42af8c64032701dbe6c947bc20e68899f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
