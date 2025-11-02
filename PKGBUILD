# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.11
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
sha256sums_aarch64=('9b6c6e0317d07ffa2e103376e690d26cf4b519b8e34fd00a71b50a2be675d205')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('9fd6add2f13ae61563e1579867a905de1be78ba5936ad57145a2da397150a730')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
