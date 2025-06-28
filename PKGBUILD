# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.1.160
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.160/opencode-linux-arm64.zip")
sha256sums_aarch64=('ff7d480a1e8fa375bf71b5620ca39c975bb3853630d2ef13bbf36d132c75b2b3')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.160/opencode-linux-x64.zip")
sha256sums_x86_64=('ab7987dee21f8b9882c02f85d0c4846d2444da29038df7adb85d55acbbed1c12')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
