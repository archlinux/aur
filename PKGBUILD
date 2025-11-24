# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.108
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
sha256sums_aarch64=('b7aa94cd29899a57a5aa044e64498c00ee173e7da8304b55b222cb033b0dd458')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('67b61b2d5190848d6e80dcef1ebf037dd84841907ca58be0c142fc37e21819ae')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
