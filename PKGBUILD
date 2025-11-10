# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.55
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
sha256sums_aarch64=('92a58f88668cd9e59f9cb910fded17ababce9c391b42c548b216f0dfce5c6ede')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('a6b2fd5acdf19cc2e788f40f6f5cd9818d78bd5d8a1f445b250f3974172cb3f4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
