# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.156
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('70b0cdf4aad328d34de1cf2d1f9ff64fe729133d2970bb8cfa18649209edf240')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('6405d3c856c7ab8ff5fee7c4b5450a8f9e42ae88e9186caa6ea607b06f291d2d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
