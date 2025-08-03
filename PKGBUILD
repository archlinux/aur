# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.3.119
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.3.119/opencode-linux-arm64.zip")
sha256sums_aarch64=('93dd31bc0895f6cfae87a686c2f94e6610748a0427d5814370e812e4c8020853')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.3.119/opencode-linux-x64.zip")
sha256sums_x86_64=('8e02165b5ed1f31bf7758d726dbb3e1f3637acd0c11539ac3db9f5ec188bda95')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
