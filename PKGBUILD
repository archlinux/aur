# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.5
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
sha256sums_aarch64=('f8db6d074bdc97d04a50ac6b96947e01bb7da4a4fca4e92b7d2b88085330b4d0')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('4e1a7d9a5868559dbfcb2fc8d81b183330c9c5c415bf38d48fb31b2d75d943b8')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
