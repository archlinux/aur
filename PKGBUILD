# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.62
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.62/opencode-linux-arm64.zip")
sha256sums_aarch64=('0c4cdc2a1bd1825d1634536c5bb90d6c5033cf84a70e7b2f131a761f5a0b72f6')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.62/opencode-linux-x64.zip")
sha256sums_x86_64=('17c8e9eda5fc52e5f29157bbd9f6adc934ee7b027233f4d5d2713f52b7f3c2e8')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
