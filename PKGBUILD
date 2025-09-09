# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.6.8
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.6.8/opencode-linux-arm64.zip")
sha256sums_aarch64=('218e0c0b69651154b677c96b00a3be8261c84e3399978865647529e9bb90cb23')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.6.8/opencode-linux-x64.zip")
sha256sums_x86_64=('729113872bc5a594f6dd1e28baefff0e1d6596434c25a7702d2438d20e2c2f91')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
