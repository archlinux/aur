# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.14.22
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
sha256sums_aarch64=('b8bb3cf495348bd41233ed39f3b9d09be7560924705b9c0ea245bbef1d4597c2')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/anomalyco/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('6946cd20989c7736a321b9bad37130dcc3227467b178fd39e20a4a0284ee8165')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
