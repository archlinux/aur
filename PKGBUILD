# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.2
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
sha256sums_aarch64=('93352b30d37d8da2e5c226085f1afbf37cf57cfcecedc813520ff2d0f8581540')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('97c95e004bb73d2039f957ea33be0635ea4e22b8dceaedf8f0983765950cf1b6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
