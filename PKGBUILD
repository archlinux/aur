# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.44
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
sha256sums_aarch64=('44a0eb12c7ee162c65e80172bf6c5d37409e09477facd5535fe9c0ad23deae8e')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('d946fd571e3f14c0146dd7f3f77019d8785840c35d9e316dfd42861e0e932f45')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
