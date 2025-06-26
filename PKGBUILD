# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.143
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.143/opencode-linux-arm64.zip")
sha256sums_aarch64=('647bd7ad80d4a4944c083758fe35fbd328cb6dea9e97bb8aef73a9c9f0ba760e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.143/opencode-linux-x64.zip")
sha256sums_x86_64=('4b791ea80875cd3cb7178774736bba62a5ed33b045e300304bc6a8da03a7b8ef')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
