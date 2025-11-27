# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.117
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
sha256sums_aarch64=('e66125011980f6d727b5a321b304875071f5810ac97b1c11b29265e2fa869eff')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('d091361cb2e720d27077c993d897db8dc2c012b02054f557ade25c89fad75fb7')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
