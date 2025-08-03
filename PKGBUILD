# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.116
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.116/opencode-linux-arm64.zip")
sha256sums_aarch64=('8da4ca4d44621f7ee6004a94f5db4f004e85057764576f3048093e595644ab85')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.116/opencode-linux-x64.zip")
sha256sums_x86_64=('c1aae9bcdf71ae894284308adc6836be6d94cb0efb9afbec0ed8fc55ad622219')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
