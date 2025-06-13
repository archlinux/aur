# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.37
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.37/opencode-linux-arm64.zip")
sha256sums_aarch64=('fcb5d69ecf9660ad3284977e065354d247e887dc6ab4c293ea88725a913fe58c')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.37/opencode-linux-x64.zip")
sha256sums_x86_64=('d3645ec51e97d26407afd598101dfd9c945d5735a8279bcbd172699a6d71a4b4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
