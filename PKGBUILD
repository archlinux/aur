# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.113
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
sha256sums_aarch64=('8fbc1ede4abf9b6e4cde68533f4b29dcdb098d66ec390b2d07f08ec04cd1820b')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('b773f60781a1b7bc9b54de8ce8abd43413b73642af540faec9f0e20bdfa8f254')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
