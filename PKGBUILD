# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.9
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
sha256sums_aarch64=('b16bd7593ea960a25d9c6849b3023bcd9b9244a6f51675341fd2052043b0670f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('a0fa4b7b8bdacbd013e79a5f69d4220d36b545cd3ea296ba765f3016fa501b5b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
