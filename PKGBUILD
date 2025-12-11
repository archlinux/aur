# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.146
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
sha256sums_aarch64=('324083b461bdadef80d2f8b9321e58d44920fc0c5294ec4c50fe2bdb1decabfe')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('96e61d6bc78088ae34504ea1911d00c7e402701255dee662adba166c01c9ed39')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
