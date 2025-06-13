# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.30
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.30/opencode-linux-arm64.zip")
sha256sums_aarch64=('3bf6a09e127566ff86687333077b880ce775c6c371447102eeaf7a4a52caf48f')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.30/opencode-linux-x64.zip")
sha256sums_x86_64=('eb0a91efc569ac054538d5320b95f1c5b93a8abac3968931c6c49ed64a863865')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
