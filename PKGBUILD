# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.11.8
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.11.8/opencode-linux-arm64.zip")
sha256sums_aarch64=('82514a0618bfc99ef15d0fc79b073de04da6d07a4469d348f61d1d3119450110')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.11.8/opencode-linux-x64.zip")
sha256sums_x86_64=('ecfee7d85c0e554dcf5c5d18110baa62dae1a9842711a939fce354ed7d7834f2')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
