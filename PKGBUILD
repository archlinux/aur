# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.24
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('119ca18b4c40bc3153fd9660ad799cca62d7caa7be17857788f5555967c2aa00')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('77f2f4db5b761820b8fe37828acc43a15c0bf23983143fbbf4ce2edfdc7e89e4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
