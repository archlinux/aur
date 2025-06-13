# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.1.36
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v0.1.36/opencode-linux-arm64.zip")
sha256sums_aarch64=('099d19cd7a52c14f87b616eb04eaa304c4a33084a99dc2b1ecf387aaf7607776')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v0.1.36/opencode-linux-x64.zip")
sha256sums_x86_64=('8d87c96cf56480faf417634bd692124b736d8d27a5efe4123f5dfc0f4e736293')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
