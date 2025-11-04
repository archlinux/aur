# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.23
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('3dc69f13d06429cfee9ef256b67545e20ea22d2c52d14bfe3fbcea3d419af61e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('0610bda7bcdf4353086dfba7c51b34ad5054f55c99682448d37a8c3c54e58f76')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
