# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.20
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.20/opencode-linux-arm64.zip")
sha256sums_aarch64=('f3215bff82b7cda37bb2bc262384a0068435539a72d038eb51e83dbff714d745')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.20/opencode-linux-x64.zip")
sha256sums_x86_64=('42b51dcca0c827ce561a1f45caed0abf68e718c86b890039de1447fae39bbbb6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
