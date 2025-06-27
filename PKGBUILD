# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.148
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.148/opencode-linux-arm64.zip")
sha256sums_aarch64=('32b03c85c1047ba2ec2a300726b24172cac06e7fbf446445e9b38d92c417e75c')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.148/opencode-linux-x64.zip")
sha256sums_x86_64=('dcc321490b8664109b320becc53135a62a9dc1c12d44e7caee1740c70ed2f866')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
