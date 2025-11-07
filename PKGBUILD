# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.44
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
sha256sums_aarch64=('d29d0577d742e15ae78af068992dadb7c1834a7158d078841e2170e28b7f5e2e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('b386100435a6eb38dc2ffcb2e92134d0c1faedb10ce7966bc29cb89177eb0bc7')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
