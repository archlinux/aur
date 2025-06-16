# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.53
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.53/opencode-linux-arm64.zip")
sha256sums_aarch64=('a7836d904d0c13580732f9664d34add686e8b0943429eeb4d0b8dd960a01385d')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.53/opencode-linux-x64.zip")
sha256sums_x86_64=('dbbf6e0db29bfc57c00fd5300a65553e31002a9a99ca6f931f3b0e0615ed1ab0')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
