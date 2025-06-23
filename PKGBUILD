# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.123
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.123/opencode-linux-arm64.zip")
sha256sums_aarch64=('402c6261f13c47d17e2fb58833932f955ea9eef394e0baa20d4fc735b011b623')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.123/opencode-linux-x64.zip")
sha256sums_x86_64=('b507f7d7e0e262f7b9caaa3cd4a83a8b70fdad93c545fda287f2d696f17af349')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
