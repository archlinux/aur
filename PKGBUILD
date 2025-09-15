# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.9.1
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.9.1/opencode-linux-arm64.zip")
sha256sums_aarch64=('d89b0d8f2bc95601a4f369978a926f49a9eb710b1ddb96d56571f7deeac4525d')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.9.1/opencode-linux-x64.zip")
sha256sums_x86_64=('26535c2cdc9dc0ebfd4882b0cbe3e6a26bda06a732f9e6667f7829c0207416c2')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
