# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.26
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
sha256sums_aarch64=('8e203288c1071da8cf6db87159c1ad5808e12efaeab60a22152d7b5aa5bce772')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('ac5f426b82bf9d7a89d857d5fe9bb75cb2fd670804e03e97e5dda9373bf47be4')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
