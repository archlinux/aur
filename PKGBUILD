# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.12
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.12/opencode-linux-arm64.zip")
sha256sums_aarch64=('d4d8f5bc04ad94d7715b111c49def0495aa53c5848ee575bdfbbd66cfb7b091d')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.12/opencode-linux-x64.zip")
sha256sums_x86_64=('888765b1e43df591ca38523c988ec0b0198bf055d1ba918ae8fff851042fa826')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
