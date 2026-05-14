# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.50
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
sha256sums_aarch64=('60ef777dcbf8b1080d10e615ff0544da975cd72b906d00f5ee7578bdb3cd38d4')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('144a8ced503e81dad0b23ad1827377fdecdebcc9bd5b3257661f0ebc7a9de891')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
