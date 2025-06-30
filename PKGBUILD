# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.165
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.165/opencode-linux-arm64.zip")
sha256sums_aarch64=('2f6197600694fe33c03ce3e4522977990ab2502d4b266674a02ea242c456c175')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.165/opencode-linux-x64.zip")
sha256sums_x86_64=('4e7015a4f51f2c2f3dd6a9659c94b74212c746c11bbac6ba1d2abeec345027cb')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
