# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.10
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
sha256sums_aarch64=('bf78f4a0bd962f80deccec5d10a80eab87fc064751d35ce56075336d452382d1')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('30ef087829eb4d4c8dae863b4fb5d8e160973fcc20237af83f185f1b0a6b87d2')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
