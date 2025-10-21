# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.12
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.15.12/opencode-linux-arm64.zip")
sha256sums_aarch64=('e3814d87c5a77afb3a359a178804ac44e86240dc123226207ed2c6202074a847')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.15.12/opencode-linux-x64.zip")
sha256sums_x86_64=('0d7d1bd82a517fb00833fe335141c05bd50b2cc806ba0144c8a808b3b0bed5db')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
