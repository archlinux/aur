# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.151
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.151/opencode-linux-arm64.zip")
sha256sums_aarch64=('7edd176b4d3514abf585de7d53eec0ea55c8419f70ceed2fa91b0c0c6eb492d8')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.151/opencode-linux-x64.zip")
sha256sums_x86_64=('9197053d84d815d765262a50a6ec2913db63e4107b2a4e6463658e489cedce40')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
