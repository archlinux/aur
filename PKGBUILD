# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.40
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.40/opencode-linux-arm64.zip")
sha256sums_aarch64=('b7b62897cecf43ac6682b96064765e63e437ec93aa05a174a48127cb967696c5')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.40/opencode-linux-x64.zip")
sha256sums_x86_64=('5fe7b683d36730f98b86a5c3e0e44a76b64c2a7f7d46d1caa6d6b608d2025a53')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
