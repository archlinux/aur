# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.5.29
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.5.29/opencode-linux-arm64.zip")
sha256sums_aarch64=('ea6ff1da7554ba582d62b24f79bddcbb58fc77444ad4408824eadf58c2197ff1')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.5.29/opencode-linux-x64.zip")
sha256sums_x86_64=('b8713701c465a5780afba389f4598f5011c17432e815bed9a49c513a4717d069')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
