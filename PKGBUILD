# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.47
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.47/opencode-linux-arm64.zip")
sha256sums_aarch64=('f3d631cfb938eeb77f078461ce8143c219a9d5285208042d20a72206fb321123')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.47/opencode-linux-x64.zip")
sha256sums_x86_64=('36143c66474a69de90c4b0a0d4a51a565b396c175e409e2bf3f2724fb6bd3a32')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
