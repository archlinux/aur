# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.54
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
sha256sums_aarch64=('052e6228cbd3309836a6ce6aa0834ef494ad7ac3cff53dd5e13f7e5d2698867d')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('f95bc36e26f471222efe2c6ac5928fb5e3c538f78ef2595cfb87908f7da17b5b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
