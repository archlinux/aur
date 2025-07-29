# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.82
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.82/opencode-linux-arm64.zip")
sha256sums_aarch64=('60be32cc3def4602ee159d32381f93b3f3e2fae9c3c44e43fcd6b1779eca08d3')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.82/opencode-linux-x64.zip")
sha256sums_x86_64=('7df447063ff3ad61889c895fea7adc634436566a810270f5756bad503bc6fcb9')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
