# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.101
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.101/opencode-linux-arm64.zip")
sha256sums_aarch64=('3815f4ae278635c41bf1cc7983a0200db53787095c11264b2872178678c1010c')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.101/opencode-linux-x64.zip")
sha256sums_x86_64=('e5dcefc905cd528059ad2a1a2d986a10ac6e72329bb814a126f401eedba748c2')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
