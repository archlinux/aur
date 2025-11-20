# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.80
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
sha256sums_aarch64=('13208e7ccaab49f2c39c7bc4110d6de28ddec6358162d4bf7d7e05a334bd3095')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('5b9bb381321bcd7cd8b68f4d8ee352ae792cd179e061aee9298e5f2051384409')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
