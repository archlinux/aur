# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.3.73
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.73/opencode-linux-arm64.zip")
sha256sums_aarch64=('0a5e6ac0576209d5b9271a490cd1f64dde2524b827694470e5c561543a465713')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.73/opencode-linux-x64.zip")
sha256sums_x86_64=('3d25480499ae15908bbb4ad7b5a34b3a8460dc2507cf90d786ef60b5dca39729')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
