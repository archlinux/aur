# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.2
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.2/opencode-linux-arm64.zip")
sha256sums_aarch64=('ed61ee548fcaa2b3712413b2832388eb0b2b28c4ceaef44e4977dc2d45fc4cdb')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.2/opencode-linux-x64.zip")
sha256sums_x86_64=('1636cd1a815e52af6e12250ae18aebfb2bef3ce7b686b4d7fa3331a4c506e501')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
