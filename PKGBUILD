# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.57
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
sha256sums_aarch64=('e25280e15a8c9b883ee27f508209dcafde21e1be6238d45c3265c44373b30eea')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('009d1f553f9becc9f02c829573a509b6adacff4717d337ccd1ecaabb894f9f63')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
