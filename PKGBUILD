# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.172
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.172/opencode-linux-arm64.zip")
sha256sums_aarch64=('47be43f6b839037af3242a39eb5fb1170d3b80abe6e412d5557a7dec0a6f8bee')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.172/opencode-linux-x64.zip")
sha256sums_x86_64=('b4bd90362059d718db1f2baf1ea0a77b11aaf05c4e16d585c400b9d35d64a0aa')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
