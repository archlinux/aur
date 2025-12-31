# Maintainer: dax
# Maintainer: adam

pkgname='opencode-bin'
pkgver=1.0.219
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
sha256sums_aarch64=('a8442b11f077d228ad3955c026577e20ec050a89c1aedbbcda5c248c9376958a')
source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/sst/opencode/releases/download/v${pkgver}${_subver}/opencode-linux-x64.tar.gz")
sha256sums_x86_64=('445a6430332e70b71931e2fbc46606f25d6c0f8362b54c732f1b31194eff82e3')

package() {
  install -Dm755 ./opencode "${pkgdir}/usr/bin/opencode"
}
