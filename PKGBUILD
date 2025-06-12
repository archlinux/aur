# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.0
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.0-beta3/opencode-linux-arm64.zip")
sha256sums_aarch64=('4f7d4b2481eae14538c8d9d122141524312aa31e15708e20eb32095b63b3d0da')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.0-beta3/opencode-linux-x64.zip")
sha256sums_x86_64=('b2d111577348e90481bcf7011489c4b6ffdcb8a96f479d947e2bd1979fd256d2')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
