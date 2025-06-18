# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.81
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.81/opencode-linux-arm64.zip")
sha256sums_aarch64=('df7b03fcaf21ca62bdbcd2c8e5164eb621deada4b750046849c4c0f1e32bff11')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.81/opencode-linux-x64.zip")
sha256sums_x86_64=('3363c00acca116684a9e0297caeebb3debd1efe39fd7db0109b761d2a330ab5f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
