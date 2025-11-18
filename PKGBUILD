# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.77
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
sha256sums_aarch64=('e43b07679b3ef89d7b402ed4418c31f96a9daa9952b39191fdf255b7c28a1ead')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('3f1e17f4ad8ee9be1ea6fc972c15b4f9da6b1c1fe149cb761dd072efa9c52e1d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
