# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.111
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.111/opencode-linux-arm64.zip")
sha256sums_aarch64=('24b73b187abd1f13c2ba1270c05dc250b94aad308d0ea514bb1fa678e58075b7')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.111/opencode-linux-x64.zip")
sha256sums_x86_64=('238927b2fae443bf720d60bd705d0ec84d2e88f764193e7124fd8ee9331bd81c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
