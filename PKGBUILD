# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.27
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
sha256sums_aarch64=('88e600ab25e1293617e38c06aa5b083940da01509832f688016fd9070c76538d')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('b2f2c84a5ccdb60e4556a9b12a01c4a46c2146385abe24b1ca6023e7deff225e')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
