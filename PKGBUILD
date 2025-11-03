# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.15
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
sha256sums_aarch64=('84fdbacf533904fec71999a7d157e0aca5d5f94c2cb5ca3387c946d79725f3db')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('0ba4518a4d44104d40716a4b6087564dfa649ed5fd0fc0f0dd37f904cfaa6718')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
