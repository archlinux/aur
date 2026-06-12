# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.17.4
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/anomalyco/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('5cb32d53238a205a4ad71f70be8d669aaf460f55121ebc16ff9d12909609dd0b')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('a2ece9181aab3817a6b59fa390b6d459b187e3ec917be802ecbca88b632c5ef9')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
