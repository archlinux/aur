# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.45
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.45/opencode-linux-arm64.zip")
sha256sums_aarch64=('875dac4f2ca7f91ca348e6961b5267cc3703b3af4e3d727ec1ad07a1cdda8916')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.45/opencode-linux-x64.zip")
sha256sums_x86_64=('9d22a90b2dd04464e25a036db0a17951e172b35852c93138d6c3dfef3a4bd584')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
