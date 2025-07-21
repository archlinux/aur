# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.52
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.52/opencode-linux-arm64.zip")
sha256sums_aarch64=('4ee2dc07fd7343790cae04dce3a94aeb436f2b25b817592789a5442cbcefb25d')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.52/opencode-linux-x64.zip")
sha256sums_x86_64=('ac01e143a4e9c2220e9bfea9b8034367c96f5f5facee7808f398ae07fa9f4329')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
