# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.20
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
sha256sums_aarch64=('941beca686e9d7cf5d3f00b0708029e4282436046883d940b992bc461ad9f52d')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('466d1da792afb090cdb300ea144469bdb19cda8d8fa339311f87fc6e1f63cac7')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
