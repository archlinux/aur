# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.8
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.15.8/opencode-linux-arm64.zip")
sha256sums_aarch64=('b7272416b37c26e8582a968c4a3fe5f05d80bcb83f916befb38ca6026a5a8eff')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.15.8/opencode-linux-x64.zip")
sha256sums_x86_64=('1adbcedbe8341dcc4f57690ae0bc5287c356a5a7ad2f2990ccc1c236943825c3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
