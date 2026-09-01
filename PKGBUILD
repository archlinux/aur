# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.18.26
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
sha256sums_aarch64=('90b99cc2356fea188d67352418ad7223559841178142f719848ca2c88a689c3e')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('7c20c1ffa91bcca0ac903752260bcc36307dff656833baead2f5ef3b224b16c6')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
