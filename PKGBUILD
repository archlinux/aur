# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.30
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('a1d8767ead3996e1394bb8118ac1f5ff87ba6c0f1e7cae3532c6727a76bccc9a')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('7bd2bef09864520eb023d6ff94c1328f13834996428ffe78b0d20363725d9118')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
