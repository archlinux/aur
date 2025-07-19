# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.35
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.35/opencode-linux-arm64.zip")
sha256sums_aarch64=('fc3ee59ccbe49ec598af73530fd52a1e8b001b98bacf0c8dcba1e752b4be2187')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.35/opencode-linux-x64.zip")
sha256sums_x86_64=('e80e637496e8ec55d97a9dd60281a1a7af8f0ee7b4e636e9b977bfa480af4560')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
