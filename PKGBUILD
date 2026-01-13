# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.16
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
sha256sums_aarch64=('54f0d708f86ac3f979572b9cb6055bb6b9df2f94c3d91525854a031b03aee156')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('f5a708c6e80819a8119657628143810d1572d190e862f67182e3e4db38ce365a')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
