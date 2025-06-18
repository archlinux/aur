# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.79
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.79/opencode-linux-arm64.zip")
sha256sums_aarch64=('188dfdfc1868f570cfcc42efbe84f89eb51b8981aec4395cbc0eab120512bea4')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.79/opencode-linux-x64.zip")
sha256sums_x86_64=('6c0a621b2ebec9baa2687586178a81456c69bbfaecc44d44d1e63b21d6725cd0')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
