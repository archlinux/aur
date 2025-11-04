# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.20
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
sha256sums_aarch64=('a4be4db6978d173d220666d349660561d72f1eb3d6106a63128d2e178d54913a')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('e0321c4b32921805ade769ba2e6389858083873b5585113a522fc5aacd4270ee')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
