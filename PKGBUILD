# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.0
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
sha256sums_aarch64=('4a989f79343da978260eccd932dca2748d308b3a510ecfb8cde45f24c4ac5e77')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('3d2b5efedd031bdfd2cb373c0684199c7bb8f7f00cfd687ff5f51bca6758a87c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
