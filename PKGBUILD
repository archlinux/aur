# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.52
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
sha256sums_aarch64=('956bb5b7d2a48a151869f5cb1a052757944789922992504c326d6d52d95e81d4')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('8b50d40784deff1b494d5d56a1ea4f61cb9605f4a013abce0adc0009e0fbf2d7')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
