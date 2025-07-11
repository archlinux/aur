# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.2.28
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.28/opencode-linux-arm64.zip")
sha256sums_aarch64=('1106bc64596e8ff6a43fb236ccc58495eac37492759272ab08ea9fccd0f6ce3b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.28/opencode-linux-x64.zip")
sha256sums_x86_64=('e9bf168ef5be5259797e81bd5c5e9002458f7c47fde5caec7f25e1bba93f6094')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
