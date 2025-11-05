# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.29
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
sha256sums_aarch64=('952966d7ea192efd34e175b4f85cc59d41d10f2bee0a8872cff1c0a1f030cd0b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('4899442380f2fcd533567018b21b1c95f2a9b77dcb6ee3312549e23c80debd97')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
