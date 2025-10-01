# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.13.6
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.13.6/opencode-linux-arm64.zip")
sha256sums_aarch64=('5ff0364175d5a357f692ca7d6598f59f811d5c7b7800b9eb8d35e3c000bd8424')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.13.6/opencode-linux-x64.zip")
sha256sums_x86_64=('324b8694f5bdf53038671dcd73044569924d4251c2bb143ed2c9b93f2661804b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
