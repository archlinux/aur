# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.44
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.44/opencode-linux-arm64.zip")
sha256sums_aarch64=('b9a1e4466107465075f4f3c4358af8754b0a61ae630d43c5721ca849a7a89eb8')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.44/opencode-linux-x64.zip")
sha256sums_x86_64=('a70e102494dcd320c4148dde8feef00e6041b4f9660cb761d00a05fb168c306a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
