# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.90
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.90/opencode-linux-arm64.zip")
sha256sums_aarch64=('a7e34b8b9df1ea0f8e7aa2c86550c21054cc6527bb5c1032b8de3e8da4ea7576')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.90/opencode-linux-x64.zip")
sha256sums_x86_64=('a04278079e4d71241276815a51b218b6e60fbb5e192c6f1d0f2fcd76ebadfd92')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
