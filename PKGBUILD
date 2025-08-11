# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.4.19
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.19/opencode-linux-arm64.zip")
sha256sums_aarch64=('cb92cf2a36d35c36ecbd0d63b2f61ea4adaa5628930187441cfaac3e1d35aabd')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.19/opencode-linux-x64.zip")
sha256sums_x86_64=('308e8e5adbbf548a00f01fbc5c2cc345d5e7ca57a6ddbf5b813a31ec24e26e38')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
