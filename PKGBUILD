# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.42
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
sha256sums_aarch64=('2359ac0995063a486e089f992bba58c72df28a5158e14e7a692ef1d797d0d1a0')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('6095ab56f1b408189445442f1100c9fa47d58ef4f980f46edddd867b1b3e0519')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
