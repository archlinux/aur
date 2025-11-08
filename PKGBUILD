# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.45
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
sha256sums_aarch64=('76ad53e37ad2405fb2a2419571f9879d339b136a4410b8b07f52d862210f6634')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('19e846399f874d5d4ad5999d7d2f04b3a5bec964eabbf902ebd363d38aa33531')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
