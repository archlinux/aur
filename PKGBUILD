# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.144
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.144/opencode-linux-arm64.zip")
sha256sums_aarch64=('aabc06521cd49041d1c7dcafe7fc6c63ed5de7c60f44f4df615f5d93e9f91be2')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.144/opencode-linux-x64.zip")
sha256sums_x86_64=('540a6ec26a947a46138a05c9dd41411f91b203c2b7c52b7cecfd2c4e2552883d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
