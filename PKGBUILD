# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.28
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.28/opencode-linux-arm64.zip")
sha256sums_aarch64=('49256bea77b75c6aaabd9fe3cc1523e721a55e3176e2921c6f9b333b7b4040f7')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.28/opencode-linux-x64.zip")
sha256sums_x86_64=('1252abe168b8196127814fb00ee35e8577aa8fa4107ac86bf3a44e26cf209874')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
