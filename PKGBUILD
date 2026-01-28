# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.1.38
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
sha256sums_aarch64=('0d5c205088acfafc9f77f25bdb3f024621cac14cabbe97cea643becb969d18ca')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('894b121e00c94f37c6404eddf01f267266babf71772c4b7bf0ecf44982f0204d')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
