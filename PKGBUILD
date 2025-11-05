# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.26
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
sha256sums_aarch64=('b34c41a9954f462cf028c1baa687cbdbe20d0daba6bbb3cebf47d2668263d4d6')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('795db51a786646917b69e0c2c037be093bccd4340a30765fce533fda0fe66477')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
