# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.9.10
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.9.10/opencode-linux-arm64.zip")
sha256sums_aarch64=('193158c30dfc0717834fcc2a64fd1bfc7eb51c735d04878db9652f39374d729b')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.9.10/opencode-linux-x64.zip")
sha256sums_x86_64=('b8ce02b16d965c7cd25a86944312a6d431918d08cabcaf75033dac35a0999a03')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
