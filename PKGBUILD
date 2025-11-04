# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.19
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
sha256sums_aarch64=('1344b8831bd66f4d507dbf15b0cbaeab35fb78b762dd76a808de1696223311d4')

source_x86_64=("${pkgname}_${pkgver}_x86_64.zip::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.zip")
sha256sums_x86_64=('fdda468d870659e5b9c98c3a5bc3edd40f326d9650a079f8f11724f05872f69c')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
