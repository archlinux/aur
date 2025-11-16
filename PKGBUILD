# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.68
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
sha256sums_aarch64=('972c794b9751b3d9d9940e6cdc6dd26d48d5618ba6a0ab5f86e3dfc0e88e4639')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('863723b9c1116844d98f16efcd09ae0801c6126852c012376acbc2dcafbe7a72')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
