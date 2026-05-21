# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.15.7
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
sha256sums_aarch64=('d2ca40f11b0eb1648cbffaf9850c122a83062b21ada18e5db29558c6bfafee0f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('6f7f95f13917b9aab8421dbb7e121abf2fecfecdccd16fd5b497f522f454f928')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
