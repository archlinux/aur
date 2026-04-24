# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.24
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
sha256sums_aarch64=('304108f05063bd17ad6df62541b48e19980d8e36d5d507ae2ebf80920990c9a2')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('2edfc17bad3ecba54ae1d9753cef9eca686fdd8a0b0f4b785f9209ee0fc8a6d2')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
