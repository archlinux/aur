# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.70
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.70/opencode-linux-arm64.zip")
sha256sums_aarch64=('03cb9e0de9855d62cde2de4e07df2c5181ea16fb4fa378401e9b61a7d8c8f496')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.70/opencode-linux-x64.zip")
sha256sums_x86_64=('e91a993863b63e2e86ad299c8c56c4abe7985b13c6722bc5edf002752b473917')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
