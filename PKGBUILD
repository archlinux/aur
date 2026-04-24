# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.23
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
sha256sums_aarch64=('ef10e94daaeed1ddaebeb2e8c88af50467a2037073f7f2c535b427c25ff90fce')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('76581beaa785b6e91499952aa0eb1185a17b15c9c66b9431bbe461f8a8a98936')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
