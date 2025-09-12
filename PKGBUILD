# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.7.4
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.7.4/opencode-linux-arm64.zip")
sha256sums_aarch64=('294a731ed9cea27c56611f3bd93876e788cdad80d0ae0d46874785bbd9e9b586')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.7.4/opencode-linux-x64.zip")
sha256sums_x86_64=('195ce49b7d0e5c5f452f24cc4529e432bde16bb079f667f55a54a2c020d4844b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
