# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.60
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
sha256sums_aarch64=('72bb4f0a74b90e0a354285ab5deb30b7e136b362ed6629e4b4aaceedf24f5732')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('d6ba0739385d3ef4a4fb1f68c56e6466d45121dbc9be5c0c3fdfa4d1c8f5a59a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
