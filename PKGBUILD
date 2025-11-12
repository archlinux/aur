# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.61
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('60dc1f4c151cc57a833ad8342f33df4c7401626879e8c1555853a51aef62a665')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('a5615ff674e7df11b3ca37f189a212583b272b525a39b00aa21883b79b22e5ec')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
