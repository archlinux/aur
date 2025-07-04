# Maintainer: dax
# Maintainer: adam

pkgname='opencode'
pkgver=0.1.192
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.192/opencode-linux-arm64.zip")
sha256sums_aarch64=('d6c7c5ff69c421c7d346f4d16f443c3540e8640d66721a40e486e3f4c27c8a61')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.192/opencode-linux-x64.zip")
sha256sums_x86_64=('90eef2c8e4a78cee3cd178b9fd9a86b5c85085a9667c604b63dd9610a40b4529')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
