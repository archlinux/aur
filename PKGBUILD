# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.4.29
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.29/opencode-linux-arm64.zip")
sha256sums_aarch64=('f74be1d68c7a0c7e50f4670b6fb63c9351f2a9c54416fdf3a1e1c05cf436daca')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.29/opencode-linux-x64.zip")
sha256sums_x86_64=('1a9d12906d4a595b2c0fa49ed14824e00d6cdd01f7f477d9c9b4d0c09968ee62')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
