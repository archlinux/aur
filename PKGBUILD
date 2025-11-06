# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.36
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
sha256sums_aarch64=('5e0e6e35a8d4df72ff82d3af2be93a251bc7a648f5fcf19d6294172b175886fc')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('545f996c08aca620dff59e8c76e87fc68d8fa2cd882e725579c72a2054a61caa')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
