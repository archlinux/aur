# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.5.24
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.5.24/opencode-linux-arm64.zip")
sha256sums_aarch64=('0922b0748c9280c7bf54bcd1450146e3b304d19765514be1ee38f3eec97e2633')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.5.24/opencode-linux-x64.zip")
sha256sums_x86_64=('59867f9051f9088f8b3de6c0910a31da277b4232469389304fa8c9ad794109d6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
