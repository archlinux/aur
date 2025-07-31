# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.104
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.104/opencode-linux-arm64.zip")
sha256sums_aarch64=('e5b634563472dff2e468b8ad8f8c12c75a78275fdbf56475893001d0f77dc980')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.104/opencode-linux-x64.zip")
sha256sums_x86_64=('bec53dd15e2e801dc6c328fc90beb350e13c92b9f9f5abc3bcb47371616217de')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
