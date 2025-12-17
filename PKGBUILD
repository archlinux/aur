# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.166
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
sha256sums_aarch64=('1aa629e8bfd7833dbe53993472bfdfd0fe51ac2bc835dc9f239314d751516a4d')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('5370367ef05b8df090311f1b542e080323ff9fed877acecdeb03e6fd3ba87e7c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
