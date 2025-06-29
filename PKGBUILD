# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.1.162
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.162/opencode-linux-arm64.zip")
sha256sums_aarch64=('d3de72c53104c9e40e94408498367fe722b84f4372d0db28769f2bdab43c6255')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.162/opencode-linux-x64.zip")
sha256sums_x86_64=('15668eea7b5ed52edd45d9775bc18db3ab0b43344b636822fe7cd04c5ef0ad05')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
