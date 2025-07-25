# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.71
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.71/opencode-linux-arm64.zip")
sha256sums_aarch64=('9d05efe281d95abe686755a930734a0871da6cfc5cc0af1ae8ad58111a291153')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.71/opencode-linux-x64.zip")
sha256sums_x86_64=('2073710528781cc069df6fd3fb1292aabbdf26c6e23ad041a69a5f30227af2fc')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
