# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.99
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

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-arm64.tar.gz")
sha256sums_aarch64=('015f45b156c92fe6068bcaf32c06f40b7cdf24559c931ade7f348cf2f10ff26f')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('9407b75321479ee3639d006cda8b4a0611b6c8036beb7efbd8f079fa69d8d56b')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
