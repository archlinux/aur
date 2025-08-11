# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.4.17
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.17/opencode-linux-arm64.zip")
sha256sums_aarch64=('53f27a4d00e64a7819a970a20e3aca362e8b524dfa833e98e9e5bf2d32ca4aea')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.17/opencode-linux-x64.zip")
sha256sums_x86_64=('d2e353962d451a4f38c127e4509c0ee002efc0d3e76646d5d41f2a88171ffc67')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
