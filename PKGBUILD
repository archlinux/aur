# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.41
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
sha256sums_aarch64=('0165b80c96c92baac930a2e6ab49a56f60d9bf767dd88d9aa3e70681aeed3db0')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('26aca063d75cec31937b0a6125ba8c9afda38574ad4029c4731789713fe77dd1')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
