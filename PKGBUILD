# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.128
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.128/opencode-linux-arm64.zip")
sha256sums_aarch64=('a9e5e03828fa830d891c919bf3a311d403b64b3c1cf6cd73306be2c62f7610b2')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.128/opencode-linux-x64.zip")
sha256sums_x86_64=('dbffd0ee957d4cd6747ebb55eae29d7ba79c2a3de925839fad2357f36709df58')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
