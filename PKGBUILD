# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.4.11
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
sha256sums_aarch64=('439d6b55945de9c359a934dc896d52f46c66b61758177345b35d4710b40506eb')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('a4ea829ebe3d4afba52bbf039baf2546aa098c4e5411d5f19487d8ef9bd9f68c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
