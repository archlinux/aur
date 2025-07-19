# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.34
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.34/opencode-linux-arm64.zip")
sha256sums_aarch64=('2ab1073ad61f931ffdc2b8f024b0666155ddb02c8dd6dc0f9dd7c43838e40c19')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.34/opencode-linux-x64.zip")
sha256sums_x86_64=('35a70f6276a002b7198dbf772d3428529e82f181f5815e333d7951684ff441e1')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
