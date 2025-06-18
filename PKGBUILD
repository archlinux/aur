# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.76
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.76/opencode-linux-arm64.zip")
sha256sums_aarch64=('0c96c4d8f955072bd3cfc2e76fddf97f84db43fa89906056b5ca2a82dd9ea933')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.76/opencode-linux-x64.zip")
sha256sums_x86_64=('c08fb34ac075cfaaefa22ea8fc76437574cae2c26b8ebad744f969a86178a4b4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
