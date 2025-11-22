# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.101
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
sha256sums_aarch64=('7314100182124c0a8abe59229f0ff64ef78a9a083a6f3c4bff4d7b931a4610e0')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('7ccd1bac07c0aa7656e92e1390d9f4550ff8281a0d7e3685e702029c534bf024')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
