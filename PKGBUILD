# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.12.0
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.12.0/opencode-linux-arm64.zip")
sha256sums_aarch64=('dd510fce2168822b6cc7e7701c103656e77eb213e6f2a98d42d733ba58b97215')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.12.0/opencode-linux-x64.zip")
sha256sums_x86_64=('8bb2d5d7d564578215ee58bcb207d9f6702c2708abed4d6a84b78594f091b79d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
