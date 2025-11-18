# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.75
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
sha256sums_aarch64=('43cf6061aba148f6251e2a0e49f401aec9df7e1ea0839446036a47a2fa6a6f00')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('f0ca99cf4044140d668697eb5d438de5ba28a5ab9ea7a9e45cb37c968fbea511')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
