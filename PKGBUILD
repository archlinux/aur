# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.123
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

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('a95710f63f79876d270a8f283ed531e41d97edf99223f7f8166a29da06af126f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('4e3aeec95f003cc3fd678e9ee965e9a5822e507f109e0b9d56be3bc8a075310c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
