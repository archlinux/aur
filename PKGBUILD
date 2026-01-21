# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.30
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
sha256sums_aarch64=('f80d48fc91844a87c0c3eb0ef4354c4396900e7ec8ebd4a9c5e442bd3ecc1078')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('e079627e7c3aca9a7b9aaf7570b94d11562eea5488bd984c14c1fd827c7d5fb2')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
