# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.140
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.140/opencode-linux-arm64.zip")
sha256sums_aarch64=('8d9bfe8351bc278a87822358e46d6fe927192ae72eb0ef5c8bd0610beb78b2a0')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.140/opencode-linux-x64.zip")
sha256sums_x86_64=('0bb28ee5d72c408d18457cd683a8927855e0753af92fff973ce590f024e61d29')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
