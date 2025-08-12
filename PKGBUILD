# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.4.25
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.25/opencode-linux-arm64.zip")
sha256sums_aarch64=('a2ffe9718f03a3e3810b17b9eb053f8dd61a344ccd992c9a23cf9631e187eb49')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.25/opencode-linux-x64.zip")
sha256sums_x86_64=('63f81569a666228fc6d02f6e882336c6d4c1697357eb305239dd62aee88e7701')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
