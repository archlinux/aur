# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.22
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
sha256sums_aarch64=('92c942a10eb9cec0b0ad54dac07a37a3c58bc335c114205b17ee527fa660925a')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('6f6573d2ffe35184e98b27780a3f1bc66ec61ce4291838600d6c34e4287a774f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
