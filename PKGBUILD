# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.2.10
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.2.10/opencode-linux-arm64.zip")
sha256sums_aarch64=('f013b96e757d3dcfb8e91ad5de4055138d2a1bcc4ccf53a00649d35175605692')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.2.10/opencode-linux-x64.zip")
sha256sums_x86_64=('bbec1ca64e2a65c9461765d6159ffdf413325d3192ddc28119824676b4cd779d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
