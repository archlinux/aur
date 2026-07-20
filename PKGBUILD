# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.4
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
sha256sums_aarch64=('eba87efba3976d533a24cca0316f8ef375b5f8e797c0a95c25ee919700b7ba35')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('bab463c3fb3224d388bb7cfad63f38703df9cf0be2cfd2ce8cb49d886b53a174')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
