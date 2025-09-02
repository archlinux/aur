# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.6.2
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.6.2/opencode-linux-arm64.zip")
sha256sums_aarch64=('53f266b697aeae1e3593099d445554e4fb4453b81c04e8eb582baae9a2e2013c')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.6.2/opencode-linux-x64.zip")
sha256sums_x86_64=('de75a0301313e282374db23a5efa45c26a602d51a747ab5e1b237cf74b29316f')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
