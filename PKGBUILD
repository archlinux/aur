# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.10
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
sha256sums_aarch64=('dbb03670aa9bd257b97aa32b8b2f422a46479d7b9dce24acf47f677684024bed')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('6af0cfa68e940988f6bb60ad6f59b237d55635297e5e4d63461a31af11111535')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
