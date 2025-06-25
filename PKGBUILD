# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.133
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.133/opencode-linux-arm64.zip")
sha256sums_aarch64=('26d39a26411c03fcadd137f5393003b40f422f6cefec21422944e4976a3546be')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.133/opencode-linux-x64.zip")
sha256sums_x86_64=('f8a2597809d25503e4573980e2c27f79ea29f9d0b97fabe7ec430e6d0e36b154')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
