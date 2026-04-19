# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.18
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
sha256sums_aarch64=('8b743b66286b6170dadff3a4383966c6dec312e1b8a0f0f1c496006ccbbfa959')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('1f1b67377b898f477692879318232fae56dbcb9cff9358cb16a60f9580f475a7')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
