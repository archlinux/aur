# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.32
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
sha256sums_aarch64=('1c34291a0d159142574c0d7c8fd736ec67e97accafc7664209301f8325db3a2e')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('6d965876bcc4d75351a42b07d6f3e45aa983e60883e56d6591cb256043a8a5d4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
