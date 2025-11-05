# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.28
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
sha256sums_aarch64=('21551290050a8feb46b00071dfbb9ff5ca6204588b8c95386db7603aee37a5c0')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('03dcbe8498db2caceca874451e6571276a374ac332f2965b958acfc6ea40163e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
