# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.103
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
sha256sums_aarch64=('b92ecd205c10c0c37161699d9eed8d715edf62611c7318d8132b51fa5bcbacf0')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('667ecb61689d6542fc0878ea5a1998d4d9b2fbfcb6a4efd1546d367ccf737518')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
