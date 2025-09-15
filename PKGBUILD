# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.9.0
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.9.0/opencode-linux-arm64.zip")
sha256sums_aarch64=('eb73c418e1aa168d11cedc20006581ef2e4cf6758828a7c54a9013f3b82ae41c')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.9.0/opencode-linux-x64.zip")
sha256sums_x86_64=('b5708f92c1fa58850462a9288b40b86d6a3aa81791629be469cff302e4b9860d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
