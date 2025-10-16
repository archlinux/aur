# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.4
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.15.4/opencode-linux-arm64.zip")
sha256sums_aarch64=('faea84a749676ae15e5bc5aadf19afc0f0d5cde8a04e43bab74dc93f1bfb169e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.15.4/opencode-linux-x64.zip")
sha256sums_x86_64=('e718065e0487b87484aec4c1830cc325daacfb37b170861136f61d469893db03')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
