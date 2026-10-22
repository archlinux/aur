# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.19.4
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
sha256sums_aarch64=('8568230ccd847dc93e95b9f6894379077d3e014a16b48040743573e77c23e85f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('849bd6b3d959a1d2ef200ed1634a51c79a45ca236aa26665d75debd694805cce')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
