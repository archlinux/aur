# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.145
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.145/opencode-linux-arm64.zip")
sha256sums_aarch64=('6e3798bc52c330745e65a4cc539676fa4b9ae68a2d8fd84af24aa89431e2ae8a')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.145/opencode-linux-x64.zip")
sha256sums_x86_64=('5d397185a9ddb664f6fe1b5a553b96bc751a00e1f1b051eff401d7a259c16ae4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
