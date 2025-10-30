# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=0.15.29
_subver=
options=('!debug' '!strip')
pkgrel=1
pkgdesc='The AI coding agent built for the terminal.'
url='https://github.com/sst/opencode'
arch=('aarch64' 'x86_64')
license=('MIT')
provides=('opencode')
conflicts=('opencode')
depends=('fzf' 'ripgrep')

source_aarch64=("${pkgname}_${pkgver}_aarch64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.zip")
sha256sums_aarch64=('7dac9a2e144bff2c953f206d99d334d973fe1b9a1cab180735c39ed9abfbe55a')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('6e29fc01e95b320768b2c5ddb51e48c52bf011bed31320f031c7425d8291d049')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
