# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.2.8
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
sha256sums_aarch64=('4fda34e5b2f789b450fb4c916ace0d411b5a3c9030641c3405cb4a75af2862fb')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('99b76f6d5dc825ef65653a1ada632ee46c1f505311eb8887fea4e3a74608b6d3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
