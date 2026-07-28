# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.8
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
sha256sums_aarch64=('3e1b4f3bd12764c911f9211910608f85429b6209900a662c7ed27196c9033b93')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('b72014b8b53427fdb5a628d2433569ee7ccd289bd5c4490636064b24791c1305')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
