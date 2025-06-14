# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.41
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.41/opencode-linux-arm64.zip")
sha256sums_aarch64=('43011bceb9e2caa14fccd68c21c185a3d04ea810df89b5ef1f1bdeec7497b4fa')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.41/opencode-linux-x64.zip")
sha256sums_x86_64=('0ae44686d8d13319d8b20b341d9d10659ac6e229ba108d30eae867f234f42ab1')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
