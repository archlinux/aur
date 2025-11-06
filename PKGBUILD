# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.34
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
sha256sums_aarch64=('2fd55a9d8e7e877063e6cfcbe8fd4f5b1247eba9b0f672ba8b09f31e72120a8d')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('cbd0137a1535525bcc38753a9ca3d2484e571313261117b1343a33ec9f385a8a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
