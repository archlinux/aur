# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.114
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

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('8b55835d3cc6e0053d99bec638d5aaabc35929fe38fab133294cf824d6d881a7')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('b48730c92c4e9ecf76ed4681aab6b7da725f0a3cda054681e64dfa990014c6c2')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
