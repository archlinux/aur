# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.90
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.90/opencode-linux-arm64.zip")
sha256sums_aarch64=('cb56f4bf7dc57a0d0177fd6619e26951a63807d32e2aa1ef9ac7a7c85cbd5a5f')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.90/opencode-linux-x64.zip")
sha256sums_x86_64=('530ed1698c9d0316468801e315270e545c94cfce9240260abc6b091acfd3652f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
