# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.194
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
sha256sums_aarch64=('5b8af53aea11c46f7a7bbeb47052780c319f9e79f387cf28d33654aacd05a44e')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('608d67033288b4cc2207f17c3d04127b897dc1ce9cece1ece76b39989238d516')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
