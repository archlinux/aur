# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.4.3
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.4.3/opencode-linux-arm64.zip")
sha256sums_aarch64=('13335e9dc01744bd8f7a93c8ba3871eaface9eda2f78a53f47f76c3cb9cf07ef')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.4.3/opencode-linux-x64.zip")
sha256sums_x86_64=('cb4b63f69a8c076572e2b69bfb83a8b1c9e4e7c01a1a0739a6ff50db96619222')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
