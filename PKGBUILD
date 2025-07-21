# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.51
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.51/opencode-linux-arm64.zip")
sha256sums_aarch64=('3c579f176329076963fbea5145cf2cf1119a2eb2bb159dc20eb86fd33f90f5fc')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.51/opencode-linux-x64.zip")
sha256sums_x86_64=('2bfbabe880dea20477b5152f3fa2815007f2d7240b3fdad57c2d1fc36943efa8')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
